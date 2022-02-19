# == Schema Information
#
# Table name: accounts
#
#  id               :bigint           not null, primary key
#  account_sub_type :integer
#  account_type     :string
#  balance          :decimal(, )
#  limit            :decimal(, )
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  authorization_id :bigint           not null
#  plaid_id         :string
#
# Indexes
#
#  index_accounts_on_authorization_id  (authorization_id)
#
# Foreign Keys
#
#  fk_rails_...  (authorization_id => authorizations.id)
#
class Account < ApplicationRecord
  belongs_to :authorization

  # enum account_type: %i(investment credit depository loan brokerage other)
  enum account_sub_type: %i(401a 401k 403B 457b 529 brokerage cash_isa education_savings_account ebt fixed_annuity gic health_reimbursement_arrangement hsa isa ira lif life_insurance lira lrif lrsp non-taxable_brokerage_account other other_insurance other_annuity prif rdsp resp rlif rrif pension profit_sharing_plan retirement roth roth_401k rrsp sep_ira simple_ira sipp stock_plan thrift_savings_plan tfsa trust ugma utma variable_annuity credit_card paypal cd checking savings money_market prepaid auto business commercial construction consumer home_equity loan mortgage overdraft line_of_credit student cash_management keogh mutual_fund recurring rewards safe_deposit sarsep payroll null)
end
