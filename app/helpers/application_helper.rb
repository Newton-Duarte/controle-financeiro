module ApplicationHelper
  ACCOUNT_TYPE = [
    "Financeira",
    "Receita",
    "Despesa"
  ]

  CUSTOMER_TYPE = [
    "Física",
    "Jurídica"
  ]

  def options_for_account_types(select)
    options_for_select(ACCOUNT_TYPE, select)
  end

  def options_for_customer_types(select)
    options_for_select(CUSTOMER_TYPE, select)
  end

end
