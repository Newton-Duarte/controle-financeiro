class Entry < ActiveRecord::Base

  belongs_to :account
  belongs_to :category
  belongs_to :user

  # Money-Rails
  # monetize :value_cents

  scope :by_user, ->(user) {
    where(:user_id => user)
  }

  scope :total_value_to_pay, ->(user) {
    where(:user_id => user, :entry_type => 'Despesa', :status => 'Pendente').sum(:value)
  }

  scope :total_value_paid, ->(user) {
    where(:user_id => user, :entry_type => 'Despesa', :status => 'Finalizado').sum(:value)
  }

  scope :total_value_to_receive, ->(user) {
    where(:user_id => user, :entry_type => 'Receita', :status => 'Pendente').sum(:value)
  }

  scope :bills_to_receive, ->(user) {
    where(:user_id => user, :entry_type => 'Receita', :status => 'Pendente').order(:date)
  }

  scope :bills_to_pay, ->(user) {
    where(:user_id => user, :entry_type => 'Despesa', :status => 'Pendente').order(:date)
  }

  scope :total_value_received, ->(user) {
    where(:user_id => user, :entry_type => 'Receita', :status => 'Finalizado').sum(:value)
  }

  scope :group_by_category, ->(user) {
    where(:user_id => user, :status => 'Finalizado').group(:category).sum(:value)
  }


end
