class User < ActiveRecord::Base
  rolify 

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_ids, :as => :admin

  #Validacoes
  validates_presence_of :username
  validates_uniqueness_of :username

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  attr_accessible :login

  before_create :create_login

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end

  def create_login             
    email = self.email.split(/@/)
    login_taken = User.where( :username => email[0]).first
    unless login_taken
      self.login = email[0]
    else  
      self.login = self.email
    end        
  end

  def self.find_for_database_authentication(conditions)
    self.where(:username => conditions[:login]).first || self.where(:email => conditions[:login]).first
  end

  
end
