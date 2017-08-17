class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @accounts = Account.by_user(current_user).limit(3)
    @entries_by_category = Entry.limit(3).group_by_category(current_user)
    @entries_to_receive = Entry.limit(3).bills_to_receive(current_user)
    @entries_to_pay = Entry.limit(3).bills_to_pay(current_user)
  end
end
