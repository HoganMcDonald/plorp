class Api::PlaidController < ApplicationController
  before_action :authenticate_user!

  def link_token
    binding.pry
    @link_token = plaid_client.create_link_token(current_user)
  end

  private

  def plaid_client
    @plaid_client = PlaidClient.new
  end
end
