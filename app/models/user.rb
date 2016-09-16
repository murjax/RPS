class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9]+\Z/, message: "must
    only contain alphanumeric characters" }
  validates :email, presence: true, uniqueness: true, format: { with: Devise::email_regexp, message: "must be
    in format of 'user@example.com'" }

  def increase_rating
    self.rating += 1
  end
end