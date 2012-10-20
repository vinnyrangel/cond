# encoding: utf-8

class HomeController < ActionController::Base
  # como atualmente a home é somente 1 página, deixei ela sem layout por enquanto
  
  
  def index
      @condominios = Condominio.all
      render :layout => false
  end

end
