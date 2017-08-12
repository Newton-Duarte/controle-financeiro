module ApplicationHelper

  PERSON_TYPE = [
    "Física",
    "Jurídica"
  ]

  ENTRY_TYPE = [
    "Despesa",
    "Receita"
  ]

  def options_for_entry_types(select)
    options_for_select(ENTRY_TYPE, select)
  end

  def options_for_person_types(select)
    options_for_select(PERSON_TYPE, select)
  end

end
