class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def update?
      record.user == user
    end
  end
end
