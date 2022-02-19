class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.budgets.empty?
      redirect_to new_budget_path
    else
      redirect_to budget_path(current_user.budgets.first)
    end
  end
end
