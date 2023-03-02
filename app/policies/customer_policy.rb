# frozen_string_literal: true

class CustomerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def details?
    user.admin?
  end

  def index?
    user.admin?
  end

  def report?
    user.admin?
  end
end
