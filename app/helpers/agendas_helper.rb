# encoding: utf-8

module AgendasHelper

  # formato a data para exibir na pagina
  def format_agenda(date)
    date.strftime("%d/%m")
  end

end