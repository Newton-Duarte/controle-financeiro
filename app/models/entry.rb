class Entry < ActiveRecord::Base

  belongs_to :account
  belongs_to :category

  attr_accessor :accounts

  # monetize :value_cents

  scope :total_value_to_pay, -> {
    where(:entry_type => 'Despesa', :status => 'Pendente').sum(:value)
  }

  scope :total_value_paid, -> {
    where(:entry_type => 'Despesa', :status => 'Finalizado').sum(:value)
  }

  scope :total_value_to_receive, -> {
    where(:entry_type => 'Receita', :status => 'Pendente').sum(:value)
  }

  scope :bills_to_receive, -> {
    where(:entry_type => 'Receita', :status => 'Pendente').order(:date)
  }

  scope :bills_to_pay, -> {
    where(:entry_type => 'Despesa', :status => 'Pendente').order(:date)
  }

  scope :total_value_received, -> {
    where(:entry_type => 'Receita', :status => 'Finalizado').sum(:value)
  }

  scope :group_by_category, -> {
    where(:status => 'Finalizado').group(:category).sum(:value)
  }


end
