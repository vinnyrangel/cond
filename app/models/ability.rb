class Ability
  include CanCan::Ability

  def initialize(usuario)
    usuario ||= Usuario.new

    if usuario.admin?
      can :manage, :all
    elsif usuario.sindico?
      can :manage, [Condominio, Pagina, Mural]
    elsif usuario.morador?
      can [:create, :destroy], [Mural, Comentario]
      can :read, [Condominio, Servico]
    elsif usuario.anunciante?
      can :manage, [Banner, Oferta, Parceiro, Servicos]
    elsif usuario.condominio
      can :read, [Condominio, Servico]
    end
  end
end