class Project < ActiveRecord::Base
  has_many :works
  has_many :users, through: :works 
  has_one :manager, class_name: "User"
end
