Pr01::Application.routes.draw do  
  root :to => 'home#index'
  opinio_model
  mount Ckeditor::Engine => '/ckeditor'
  
  scope "/admin" do
    resources :servicos, :ofertas, :parceiros, :banners, :campanhas
  end
  
  #scope :publicidade do 
    #resources :ofertas, :parceiros, :banners, :servicos do
    #end

    #namespace :servicos do
      #resources :tipos_servicos, :path => '', :only => [:index] do
        #resource :servicos
      #end
    #end
  #end
  
  #match ':controller/:id/:action/:tipo'
  # TODO: resources de paginas e murais dentro de condominio
  scope :condominio do
    resources :condominios do
      resources :avisos
      resources :agendas do
        resources :eventos, :controller => "agendas/eventos"
      end
    end
    
    resources :paginas, :murais do
      resources :opinio
    end
  end
  
  scope :usuarios do
    devise_for :usuarios, :controllers => { :omniauth_callbacks => "usuarios/omniauth_callbacks" }

    resources :admin, :on => :collection, :only => [:index], :controller => "usuarios/admins" do
      get 'enviar_mensagem', :action => 'enviar_mensagem', :on => :collection
      get 'predios', :action => 'predios', :on => :collection
      get 'moradores', :action => 'moradores', :on => :collection
      get 'convidar', :action => 'convidar_moradores', :path => 'convidar_moradores', :on => :collection
    end

    resources :usuarios do
      get 'anunciantes', :on => :collection, :controller => "usuarios/anunciantes", :action => "index"
      get 'cadastro', :on => :collection, :action => "sem_lar"
    end

    get 'perfil', :controller => 'usuarios', :action => 'edit'
    get 'aviso', :controller => 'usuarios', :action => 'leitura_aviso'
  end
end