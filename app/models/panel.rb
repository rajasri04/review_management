class Panel < ActiveRecord::Base
  has_and_belongs_to_many :staffs
  has_many :projects
end
