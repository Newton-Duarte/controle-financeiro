class Transference < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Money-Rails
  # monetize :amount_cents
end
