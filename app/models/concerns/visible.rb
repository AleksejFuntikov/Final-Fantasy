# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern
<<<<<<< HEAD
  
  VALID_STATUSES = ["published", "private", "archived"]
=======
>>>>>>> ceaf6b173dc917f7527dbe47bc21e197dfd7a170

  included do
    enum status: { "published" => "published", "privated" => "privated", "archived" => "archived" }
    scope :public_count, -> { published.count }
  end
<<<<<<< HEAD

  class_methods do
      def public_count
          where(status: :published).count
      end
    end

  def archived?
    status == "archived"
  end
end
=======
end
>>>>>>> ceaf6b173dc917f7527dbe47bc21e197dfd7a170
