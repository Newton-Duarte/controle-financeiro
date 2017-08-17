class User < ActiveRecord::Base

  after_create :create_accounts

  # Associations
  has_one :user_profile
  has_many :accounts
  has_many :entries
  has_many :transferences
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

  def create_accounts
    @user = User.last
    @account = Account.new
    @account.description = "Tesouraria"
    @account.balance = 0.00
    @account.user = @user
    @account.save

    @user = User.last
    @account = Account.new
    @account.description = "Banco"
    @account.balance = 0.00
    @account.user = @user
    @account.save
  end

end
