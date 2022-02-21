class SpendingPlan < ApplicationRecord
  belongs_to :budget
  belongs_to :account

  validates_presence_of :budget, :account, :limit
end
