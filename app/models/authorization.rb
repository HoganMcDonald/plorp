# == Schema Information
#
# Table name: authorizations
#
#  id           :bigint           not null, primary key
#  access_token :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Authorization < ApplicationRecord
  has_many :accounts

  def plaid_accounts
    plaid_client.accounts
  end

  private

  def plaid_client
    @plaid_client ||= PlaidClient.new access_token: access_token
  end
end
