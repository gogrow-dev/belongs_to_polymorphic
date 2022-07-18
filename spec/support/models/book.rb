# frozen_string_literal: true

class Book < ActiveRecord::Base
  validates :title, presence: true

  belongs_to_polymorphic :owner, allowed_classes: [Publisher, User]
end
