class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :email, presence: true, if: :email_required?
  validates :password, presence: true, confirmation: true, length: Devise.password_length, if: :password_required?

  private

  def email_required?
    true
  end

  def password_required?
    !persisted? || (!password.nil? && !password_confirmation.nil?)
  end
end
