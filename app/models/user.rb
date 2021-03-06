class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, 
  #        :recoverable, :rememberable, :trackable, :validatable
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :invitable, :database_authenticatable, :registerable, :confirmable,
       :recoverable, :rememberable, :trackable, :validatable
         
  has_many :products, dependent: :destroy
end
