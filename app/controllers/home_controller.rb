class HomeController < ApplicationController
  def index
    @accounts = Account.limit(3)
    @entries_by_category = Entry.limit(3).group_by_category
    @entries_to_receive = Entry.bills_to_receive.limit(3)
    @entries_to_pay = Entry.bills_to_pay.limit(3)
  end
end
