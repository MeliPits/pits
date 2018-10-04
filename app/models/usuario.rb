class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  def admin?
  	self.tipo == 1
  end

  def secretary?
  	self.tipo == 2
  end

  def asesor?
  	self.tipo == 3
  end 
end
