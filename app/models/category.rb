# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, length: { in: 2..100 }, uniqueness: true
end
