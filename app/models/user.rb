class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :assign_default_role

  private
    def assign_default_role
       add_role(:editor)
     end
end
