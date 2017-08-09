class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  scope :total_amount_to_pay, -> {
    where(:entry_type => 'Despesa', :status => 'Pendente').sum(:amount)
  }

  scope :total_amount_paid, -> {
    where(:entry_type => 'Despesa', :status => 'Finalizado').sum(:amount)
  }

  scope :total_amount_to_receive, -> {
    where(:entry_type => 'Receita', :status => 'Pendente').sum(:amount)
  }

  scope :total_amount_received, -> {
    where(:entry_type => 'Receita', :status => 'Finalizado').sum(:amount)
  }



end
