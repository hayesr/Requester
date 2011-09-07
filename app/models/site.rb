class Site < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
