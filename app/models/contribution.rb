class Contribution < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :student, class_name: "User"
end