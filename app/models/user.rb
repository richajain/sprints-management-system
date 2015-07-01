class User < ActiveRecord::Base
  has_many :works
  has_many :projects, through: :works
  
end
