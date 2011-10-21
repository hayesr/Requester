class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :sites, :through => :subscriptions
  
  has_many :assignments
  has_many :needs, :through => :assignments
  
  has_and_belongs_to_many :roles
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def assign(need)
    self.needs << need 
  end
  
  def subscribe(site)
    self.sites << site
  end
  
end