# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Budget < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :authorizations, dependent: :destroy
  has_many :accounts, through: :authorizations
  has_one :spending_plan

  validates_presence_of :name
end
