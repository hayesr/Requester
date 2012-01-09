class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :sites, :through => :subscriptions
  
  has_many :assignments
  has_many :needs, :through => :assignments
  
  has_and_belongs_to_many :roles
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :site_ids, :need_ids, :role_ids
  
  def assign(need)
    self.needs << need 
  end
  
  def subscribe(site)
    self.sites << site
  end
  
  def is_admin?
    member_of_role?("Admin")
  end
  
  def is_site_approver?
    member_of_role?("Site Approver")
  end
  
  def is_staff?
    member_of_role?("Staff")
  end
  
  def member_of_role?(role)
    roles.collect(&:name).include?(role)
  end
  
end