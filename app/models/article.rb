# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 40 }

  validates :body, presence: true, length: { minimum: 5, maximum: 100_000 }
end
