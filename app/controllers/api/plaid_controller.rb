class Api::PlaidController < ApplicationController
  before_action :authenticate_user!

  def link_token
    @link_token = plaid_client.create_link_token(current_user)
  end

  def access_token
    budget = current_user.budgets.find(access_token_params[:budget_id])
    access_token = plaid_client.create_access_token(access_token_params[:public_token])
    CreateAuthorization.call(access_token: access_token, budget: budget)
  end

  private

  def access_token_params
    params.permit(:public_token, :budget_id)
  end

  def plaid_client
    @plaid_client = PlaidClient.new
  end
end
