class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  def self.admins
    where(:name => "Admin").first.users
  end
end
