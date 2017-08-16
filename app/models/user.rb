class User < ActiveRecord::Base

  # Associations
  has_one :user_profile
  accepts_nested_attributes_for :user_profile

  # Validations

  validate :nested_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "Preencha todos os campos.")
    end
  end

  def nested_attributes_blank?
    user_profile.first_name.blank? || user_profile.last_name.blank?
  end

end
