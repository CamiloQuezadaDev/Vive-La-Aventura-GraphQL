class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name 

  belongs_to :company 

  before_save :generate_authentication_token  

  def generate_authentication_token 
    if self.authentication_token.nil? 
      token = ''
      loop do  
        token = Devise.friendly_token(50)
        break token unless User.where(authentication_token: token).first 
      end
      self.authentication_token = token
    end
  end 

  def full_name 
    "#{first_name} #{last_name}"
  end

  def admin? 
    self.has_role? :admin
  end

end
