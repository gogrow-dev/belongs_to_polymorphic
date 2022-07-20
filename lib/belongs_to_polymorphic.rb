# frozen_string_literal: true

require 'active_record'
require 'belongs_to_polymorphic/version'
require 'belongs_to_polymorphic/associations'

I18n.load_path << File.expand_path('config/locales/en.yml')

module BelongsToPolymorphic; end

# Extend ActiveRecord::Base with belongs to polymorphic associations
ActiveRecord::Base.include BelongsToPolymorphic::Associations
