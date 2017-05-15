
class Leave < ApplicationRecord
	validates_presence_of  :reason, :title, :start_date, :end_date, :no_of_days, :user_id
	belongs_to :user, optional:true
end
