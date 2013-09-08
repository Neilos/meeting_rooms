class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook,:google_oauth2, :twitter]

  has_many :omniauth_identities, :dependent => :destroy
  has_many :memberships, :dependent => :destroy, :inverse_of => :user
  validates_associated :memberships
  has_many :organizations, :through => :memberships
  validates_associated :organizations
  validates :name, presence: :true
end
