# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :commenter, presence: true, length: { minimum: 2, maximum: 20 }

  validates :commenter, format: { with: /\A[a-zA-Z\s-]+\z/,
                                  message: "only allows letters" }

  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
end
