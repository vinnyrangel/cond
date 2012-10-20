# encoding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # NUNCA utilizar a variável @meu_condominio diretamente. Sempre chamar o helper
  # o uso deste helper garante que a query será feita somente uma unica vez e posteriormente poderemos utilizá-lo
  # como variável de sessão.
  def meu_condominio
    @meu_condominio ||= current_usuario && current_usuario.condominio
  end
  
  protected
  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end

  # for ckeditor: https://github.com/galetahub/ckeditor
  # Cancan example
  def ckeditor_authenticate
    authorize! action_name, @asset
  end

  # Set current_user as assetable
  def ckeditor_before_create_asset(asset)
    asset.assetable = current_usuario
    return true
  end

  def after_sign_in_path_for(resource)
    if meu_condominio
      condominio_path(meu_condominio)
    else
      logger.error "Inconsistencia. Usuário sem condominio"
      root_path
    end
  end

end
