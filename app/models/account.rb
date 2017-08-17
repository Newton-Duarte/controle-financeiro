class Account < ActiveRecord::Base
  has_many :entries
  belongs_to :user

  # Money-Rails
  # monetize :balance_cents

  scope :by_user, ->(user) {
    where(:user_id => user)
  }


end
