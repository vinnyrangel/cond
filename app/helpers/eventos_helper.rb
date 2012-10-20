# encoding: utf-8

module EventosHelper

  def evento_data(d)
    d.strftime("%d/%m/%Y")
  end

  def evento_status(s)
    case s
    when 0 
      'Reservado'
    when 1 
      'Pago'
    end
  end

  def evento_usuario(u)
    usuario = Usuario.find_by_id(u)

    "#{usuario.nome} (#{usuario.apartamento.numero})"
  end

end