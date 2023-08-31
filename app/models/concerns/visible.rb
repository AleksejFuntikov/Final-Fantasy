# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  included do
    enum status: { published: 0, privated: 1, archived: 2 }
  end

  class_methods do
    def public_count
      public.count
    end
  end
end
