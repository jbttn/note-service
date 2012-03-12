class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  has_many :notes, foreign_key: 'owner_id'
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  validates :username, :presence => true,
                       :uniqueness => true,
                       :format => { :with => /\A[A-Za-z0-9_-]+\Z/ }
end
