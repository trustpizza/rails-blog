class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :posts
  has_many :comments, dependent: :destroy

  enum role: { user: 0, author: 1, admin: 2, owner: 3 }

  def self.filtered_users(current_user)
    if current_user.admin?
      where.not(role: [:admin, :owner])
    elsif current_user.owner?
      where.not(id: current_user.id)
    else
      none
    end
  end
end
