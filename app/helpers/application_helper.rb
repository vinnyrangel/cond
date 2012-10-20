# encoding: utf-8

module ApplicationHelper

  # retorna as páginas públicas, exibidas na home
  def paginas_publicas
    @paginas_publicas ||= Pagina.where(:condominio_id => meu_condominio, :ativo => true, :chamada => true) if meu_condominio
  end
  
  # é necessário redefinir este método aqui no helper para ser chamado pelas views
  def meu_condominio
    @_controller.meu_condominio
  end

  # auxilio no desenvolvimento local
  def development_info
    status = current_usuario.nil? ? "Usuário deslogado" : "Usuário logado"

    raw('<div class="navbar navbar-fixed-top">
          <div class="navbar-inner">
            <div class="container">
              <a class="brand" href="#">' + status + '</a>

              <ul class="nav">
                <li><a href="">Página inicial</a></li>
                <li><a href="/usuarios/sign_in">Página de login</a></li>
                <li><a href="/usuarios/sign_out">Página de logout</a></li>
              </ul>
            </div>
          </div>
        </div>')

  end
end
