# == Schema Information
#
# Table name: authorizations
#
#  id           :bigint           not null, primary key
#  access_token :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  budget_id    :bigint           not null
#
# Indexes
#
#  index_authorizations_on_budget_id  (budget_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#
class Authorization < ApplicationRecord
  belongs_to :budget
  has_many :accounts, dependent: :destroy

  def plaid_accounts
    plaid_client.accounts
  end

  private

  def plaid_client
    @plaid_client ||= PlaidClient.new access_token: access_token
  end
end
