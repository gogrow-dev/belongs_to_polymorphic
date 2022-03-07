require 'belongs_to_polymorphic/version'
require 'active_support/concern'

module BelongsToPolymorphic
  extend ActiveSupport::Concern

  class_methods do
    # rubocop:disable Metrics/AbcSize
    def belongs_to_polymorphic(name, allowed_classes:, **options)
      allowed_classes = Array.new(allowed_classes)
      belongs_to name, polymorphic: true, **options
      classes = allowed_classes.map(&:name)
      classes << nil if options[:optional]
      validates "#{name}_type", inclusion: { in: classes }
      define_singleton_method("#{name}_types") { allowed_classes }

      # generates a generic finder method
      define_singleton_method("with_#{name}") do |type|
        type = case type
               when Class then type.name
               when String then type
               else type.class.name
               end
        where("#{name}_type" => type)
      end

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
    # rubocop:enable Metrics/AbcSize
  end
end

ActiveRecord::Base.include BelongsToPolymorphic
