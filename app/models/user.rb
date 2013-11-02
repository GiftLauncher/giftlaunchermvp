class User < ActiveRecord::Base
  has_one :facebook, :dependent => :destroy, :inverse_of => :user

  validates_uniqueness_of :email
end
