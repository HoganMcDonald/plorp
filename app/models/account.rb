# == Schema Information
#
# Table name: accounts
#
#  id               :bigint           not null, primary key
#  account_sub_type :integer
#  account_type     :integer
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
end
