# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Budget < ApplicationRecord
  has_and_belongs_to_many :users
end
