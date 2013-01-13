class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :authentications  
  has_many :cars
  
  # Include default devise modules. Others available are:  
  # :token_authenticatable, :lockable, :timeoutable and :activatable  
  # :confirmable,  
  devise :database_authenticatable, :registerable,   
         :recoverable, :rememberable, :trackable, :validatable  
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname , :lastname , :mobile , :location , :pricture , :thumbnail , :email, :password, :password_confirmation, :remember_me
  
  def apply_omniauth(omniauth)  
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])  
  end  
  
  
  def password_required?  
    (authentications.empty? || !password.blank?) && super  
  end  
  
  
end
