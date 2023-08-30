# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 10, maximum: 40}

  validates :title, format: { with: /\A[a-zA-Z\s\-]+\z/,
    message: "only allows letters" }

  validates :body, presence: true, length: { minimum: 5, maximum: 100000 }
end
