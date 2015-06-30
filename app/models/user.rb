class User < ActiveRecord::Base
  has_many :works
  has_many :projects, through: :works
  
  def self.search(query)
  	where("email like ?", "%#{query}%") 
  end
  
end
