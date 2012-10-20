class Usuario < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :nome, :email, :password, :password_confirmation, :remember_me, :tipo_usuario_id

	# associacoes
	has_one :tipo_usuario
	
	has_one :usuario_apartamento
	has_one :apartamento, :through => :usuario_apartamento
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	def admin?
		tipo_usuario_id == 1
	end

	def morador?
		tipo_usuario_id == 2
	end

	def sindico?
		tipo_usuario_id == 3
	end

	def anunciante?
		tipo_usuario_id == 4
	end

	def condominio
		apartamento && apartamento.condominio
	end
	
	# Como o objeto usuário será exibido
	def apresentacao
	  if apartamento
	    "#{nome} - apto. #{apartamento.numero} #{condominio.nome}"
	  else
	    "#{nome}"
	  end
	end

	# omniauth
	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
		data = access_token.extra.raw_info
		
		if user = Usuario.where(:email => data.email).first
			user
		else
			nome = "#{data.first_name} #{data.last_name}"
			Usuario.create!(:email => data.email, :nome => nome, :password => Devise.friendly_token[0,20]) 
		end
	end
end
