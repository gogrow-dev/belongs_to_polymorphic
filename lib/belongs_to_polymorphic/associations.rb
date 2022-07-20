# frozen_string_literal: true

module BelongsToPolymorphic
  module Associations
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def belongs_to_polymorphic(name, allowed_classes:, **options)
        allowed_classes = Array.new(allowed_classes)
        belongs_to name, polymorphic: true, **options
        validates "#{name}_type", inclusion: {
          in: classes(allowed_classes, options),
          message: I18n.t('belongs_to_polymorphic.errors.messages.class_not_allowed',
                          class: '%<value>s')
        }

        define_singleton_method("#{name}_types") { allowed_classes }
        define_generic_finder_method(name)
        define_scopes_and_instance_methods(name, allowed_classes)
      end

      private

      def classes(allowed_classes, options)
        classes = allowed_classes.map(&:name)
        classes << nil if options[:optional]
        classes
      end

      # Generates a generic finder method
      def define_generic_finder_method(name)
        define_singleton_method("with_#{name}") do |type|
          type = case type
                 when Class then type.name
                 when String then type
                 else type.class.name
                 end
          where("#{name}_type" => type)
        end
      end

      def define_scopes_and_instance_methods(name, allowed_classes)
        allowed_classes.each do |model|
          model_name = model.name
          model_name_sanitized = model_name.underscore.tr('/', '_')
          # generates scope for each allowed class
          scope "with_#{name}_#{model_name_sanitized}",
                -> { where("#{name}_type" => model_name) }

          # generates instance method for each allowed class to check if type is that class
          define_method("#{name}_type_#{model_name_sanitized}?") do
            public_send("#{name}_type") == model_name
          end
        end
      end
    end
  end
end
