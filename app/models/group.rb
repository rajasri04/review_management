class Group < ActiveRecord::Base
  has_many :student_groups
  has_many :students,through: :student_groups
  has_one :project
  has_one :staff,through: :project
end
