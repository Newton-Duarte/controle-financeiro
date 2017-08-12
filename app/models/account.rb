class Account < ActiveRecord::Base
  has_many :entries

  attr_accessor :entries

  # monetize :balance_cents

  scope :paid_by, ->(account_id) {
    where(Account.entries)
  }

end
