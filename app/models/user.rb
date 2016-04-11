class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes

  ROLES = %i[admin moderator author banned]

  def role_enum
	%i[admin moderator author banned] 	
  end

end
