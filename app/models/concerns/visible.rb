# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  included do
    enum status: { "published" => "published", "privated" => "privated", "archived" => "archived" }
    scope :public_count, -> { published.count }
  end
end

