# encoding: UTF-8

TipoUsuario.create([
  { nome: "Administrador" },
  { nome: "Morador" },
  { nome: "Sindico" },
  { nome: "Anunciante" }
])

Usuario.create([
  { nome: "Dona Florinda", tipo_usuario_id: 1, email: "user1@email.com", password: 'abc123'},
  { nome: "Chapolin Colorado", tipo_usuario_id: 2, email: "user2@email.com", password: 'abc123'},
  { nome: "Seu Madruga", tipo_usuario_id: 3, email: "user3@email.com", password: 'abc123'},
  { nome: "Professor Girafales", tipo_usuario_id: 4, email: "user4@email.com", password: 'abc123'}
  ])
usuario_administrador = Usuario.find_by_email("user1@email.com")
usuario_morador = Usuario.find_by_email("user2@email.com")
usuario_sindico = Usuario.find_by_email("user3@email.com")
usuario_anunciante = Usuario.find_by_email("user4@email.com")


Condominio.create([
  { nome: "Blue",},
  { nome: "Rio 2",},
  { nome: "Mirante Campestre", logo_file_name: "logo_mirante_campestre.jpg", logo_content_type: "image/jpeg", logo_file_size: 57447, logo_updated_at: "2012-03-18 05:18:45"}
  ])

Apartamento.create([
  { numero: 1230, predio_id: 1, condominio_id: 3 },
  { numero: 12, predio_id: 2, condominio_id: 3 }
])


apartamento = Apartamento.last

a = Usuario.find_by_tipo_usuario_id 1
a.apartamento = apartamento

a = Usuario.find_by_tipo_usuario_id 3
a.apartamento = apartamento


cond_rio2 = Condominio.find_by_slug('rio-2')

Predio.create([
  { nome: "Tulipa", andares: 10, qtd_apart_andar: 5, condominio_id: 1, sindico_id: 1, telefone: 123123 },
  { nome: "Rosa", andares: 10, qtd_apart_andar: 5, condominio_id: 1, sindico_id: 1,telefone: 123123 },
  { nome: "Bacons", andares: 10, qtd_apart_andar: 5, condominio_id: 1, sindico_id: 1,telefone: 123123 },  
  { nome: "Margarida", andares: 3, qtd_apart_andar: 5, condominio_id: 2, sindico_id: 1,telefone: 123123 },
  # Rio 2
  { nome: "Alsácia", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Borgonha", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Bretanha", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Cote D'Azur", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Fontana Di Trevi", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Front Lake", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Gênova", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Green Park", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Normandie", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Provence", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "San Remo", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Sardenha", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Sicilia", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Verano", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 },
  { nome: "Verona", andares: 3, qtd_apart_andar: 5, condominio_id: cond_rio2.id, telefone: 24211919, sindico_id: 3 }
])

Mural.create([
    { titulo: "carros de visitantes", corpo: "Carros de visitantes estão sendo estacionados no estacionamento principal", usuario_id: usuario_sindico, condominio: cond_rio2, comentavel: true, publico: true, parent_id: nil },
    { titulo: "chegada do papai noel", corpo: "No natal teremos o papai noel vindo de helicóptero", usuario_id: usuario_sindico, condominio: cond_rio2, comentavel: false, publico: true, parent_id: nil },
    { titulo: "cheiro de cachorro no elevador", corpo: "Pessoal, o elevador está ficando com cheiro de cachorro molhado. Favor dar banho nos seus cachorros", usuario_id: usuario_anunciante, condominio: cond_rio2, comentavel: false, publico: true, parent_id: nil }
])

Pagina.create([
  { titulo: "Obras na fachada", corpo: "Lorem ipsum", chamada: "Obras na fachada", ativo: true, usuario_id: 1, condominio_id: 1 },
  { titulo: "la la", corpo: "Lorem ipsum", chamada: "Reservar playground", ativo: true, usuario_id: 1, condominio_id: 1 },
  { titulo: "Ramais uteis", corpo: "Ramais uteis", chamada: "Ramais uteis", ativo: true, usuario_id: 1, condominio_id: 1 }
])





### Mirante Campestre ###


condominio = Condominio.find_by_slug('mirante-campestre')

Pagina.create([
  { titulo: "Agenda", corpo: "Lorem ipsum", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id },
  { titulo: "Telefones Uteis", corpo: "Lorem ipsum", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id },
  { titulo: "Documento", corpo: "Ramais uteis", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id },
  { titulo: "Corpo Diretivo", corpo: "Lorem ipsum", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id },
  { titulo: "Livro de Ocorrências", corpo: "Lorem ipsum", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id },
  { titulo: "Fale com Sindíco", corpo: "Ramais uteis", chamada: 1, ativo: true, usuario_id: 1, condominio_id: condominio.id }
])

Mural.create([
    { titulo: "carros de visitantes", corpo: "Carros de visitantes estão sendo estacionados no estacionamento principal", usuario_id: usuario_sindico, condominio: condominio, comentavel: true, publico: true, parent_id: nil },
    { titulo: "chegada do papai noel", corpo: "No natal teremos o papai noel vindo de helicóptero", usuario_id: usuario_sindico, condominio: condominio, comentavel: false, publico: true, parent_id: nil },
    { titulo: "cheiro de cachorro no elevador", corpo: "Pessoal, o elevador está ficando com cheiro de cachorro molhado. Favor dar banho nos seus cachorros", usuario_id: usuario_anunciante, condominio: condominio, comentavel: false, publico: true, parent_id: nil }
])

Agenda.create([
  { nome: "Salão de Festas", condominio_id: condominio.id},
  { nome: "Reuniões de Condominio", condominio_id: condominio.id}
])

Evento.create([
  { agenda_id: 1, titulo: "Nome do evento", descricao: "nao sei", status: 0, usuario_id: 1, dia: '1/01/2012'},
  { agenda_id: 1, titulo: "Novo evento", descricao: "nao sei", status: 1, usuario_id: 1, dia: '1/02/2012'},
  { agenda_id: 1, titulo: "Mais um evento", descricao: "nao sei", status: 2, usuario_id: 1, dia: '1/03/2012'},
  { agenda_id: 2, titulo: "Nome do evento", descricao: "nao sei", status: 0, usuario_id: 1, dia: '1/01/2012'},
  { agenda_id: 2, titulo: "Novo evento", descricao: "nao sei", status: 1, usuario_id: 1, dia: '1/02/2012'},
  { agenda_id: 2, titulo: "Mais um evento", descricao: "nao sei", status: 2, usuario_id: 1, dia: '1/03/2012'}
])

Aviso.create([
  { corpo: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.",
    condominio_id: condominio.id  }
])


