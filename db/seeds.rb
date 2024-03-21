require "open-uri"

puts "Creating seeds"
sleep 1
puts "Setting everything ready"
sleep 1
# Destroy all records, before seed creation
User.destroy_all
Wedding.destroy_all
Gift.destroy_all
puts "All records destroyed"

# Create a new user and wedding
couple_photo = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/imag_foto_casal_bvhsar.jpg")
couple_photo2 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/imag_foto_casal_bvhsar.jpg")
couple_photo3 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/imag_foto_casal_bvhsar.jpg")
user_photo = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_user.jpg")
user = User.new(
  email: "luiz@yahoo.com.br",
  password: "123456",
  first_name: "Luiz",
  last_name: "Andrade",
  phone: "21999999999"
)
user.photo.attach(io: user_photo, filename: "", content_type: "image/png")
user.save!
user2 = User.new(
  email: "riccieri@yahoo.com.br",
  password: "123456",
  first_name: "Riccieri",
  last_name: "Bosa",
  phone: "21939939999"
)
user2.save!
user3 = User.new(
  email: "josimar@yahoo.com.br",
  password: "123456",
  first_name: "Josimar",
  last_name: "Machado",
  phone: "21935937999"
)
user3.save!

wedding = Wedding.new(
  welcome_message: "No site vocês encontrarão todas as informações sobre o nosso grande dia. Estamos muito felizes em compartilhar esse momento com vocês. Agradecemos por todo o carinho e apoio que temos recebido. Contamos com a presença de cada um de vocês para celebrar conosco. Beijos, Cecília e Luiz.",
  date: "Sat, 16 Nov 2024",
  address: "Rua Visconde de Pirajá, 339 - Ipanema, Rio de Janeiro - RJ, 20030-002",
  wedding_info: "A cerimônia será realizada na Igreja Nossa Senhora da Paz, no Leblon, às 16h. Pedimos que todos cheguem no horário e os padrinhos e madrinhas, com uma hora de atecedência, por favor. Logo após a cerimônia, os convidados podem seguir para o local da festa, que será no Copacabana Palace, às 19h30.",
  user_id: user.id,
  time: "Sat, 16 Nov 2024 16:00:00.000000000 UTC +00:00",
  partner_email: "cecilia@gmail.com",
  partner_profile: "Noiva",
  partner_first_name: "Cecilia",
  partner_last_name: "Moreira",
  partner_phone: "21999999988"
)
wedding.couple_photo.attach(io: couple_photo, filename: "", content_type: "image/png")
wedding.save!

wedding2 = Wedding.new(
  welcome_message: "Saudações a todos os amigos e familiares que nos acompanham neste momento especial! Este é o nosso espaço dedicado ao enlace que se avizinha. Estamos transbordando de alegria por compartilhar este momento único com cada um de vocês. Expressamos nossa gratidão por todo o amor e apoio que temos recebido ao longo desta jornada. Esperamos ansiosamente por sua presença para celebrar conosco. Com carinho, Mia e Rafael.",
  date: "Sat, 19 Oct 2024",
  address: "Rio de Janeiro",
  wedding_info: "A cerimônia será realizada na encantadora Igreja de São Francisco Xavier, em Niterói, às 16h. A recepção acontecerá no magnífico Hotel Belmond Copacabana Palace, às 20h.",
  user_id: user2.id,
  time: "Sat, 19 Oct 2024 19:00:00.000000000 UTC +00:00",
  partner_email: "mia@gmail.com",
  partner_profile: "Noiva",
  partner_first_name: "Mia",
  partner_last_name: "Rodrigues",
  partner_phone: "21999949988"
)
wedding2.couple_photo.attach(io: couple_photo2, filename: "", content_type: "image/png")
wedding2.save!

wedding3 = Wedding.new(
  welcome_message: "Olá a todos os queridos que compartilham conosco este momento inesquecível! Estamos radiantes por estarmos juntos neste portal dedicado ao nosso casamento. Cada mensagem de carinho e apoio nos enche de alegria e gratidão. Convidamos calorosamente a todos para se juntarem a nós nesta celebração memorável. Com amor e felicidade, Sofia e André.",
  date: "Sat, 25 May 2024",
  address: "São Paulo",
  wedding_info: "A cerimônia será realizada na deslumbrante Capela São Francisco de Assis, em Campos do Jordão, às 17h. A recepção será no requintado Château Lacave, às 19h.",
  user_id: user3.id,
  time: "Sat, 25 May 2024 17:30:00.000000000 UTC +00:00",
  partner_email: "sofia_andre@yahoo.com",
  partner_profile: "Noiva",
  partner_first_name: "Sofia",
  partner_last_name: "Silva",
  partner_phone: "11988887777"
)
wedding3.couple_photo.attach(io: couple_photo3, filename: "", content_type: "image/png")
wedding3.save!
puts "User and Wedding created"

# Create Weddings tips
tip1 = Tip.new(
  title: "Trajes",
  content: "QUEREMOS QUE TODOS SE SINTAM CONFORTÁVEIS E ELEGANTES! COMO REFERÊNCIA OFICIAL, VOCÊS PODEM CONSIDERAR TRAJES DE PASSEIO COMPLETO.",
  wedding_id: wedding.id
)
tip1.save!
tip2 = Tip.new(
  title: "Salão de Beleza",
  content: "SELECIONAMOS ALGUNS SALÕES DE BELEZA QUE FORAM BEM RECOMENDADOS PARA AQUELAS QUE DESEJAREM AGENDAR CABELO E/OU MAQUIAGEM: WERNER IPANEMA (21) 2137-8958; STUDIO LEBLON: (21) 99652-7627; FIL HAIR & EXPERIENCE: (21) 2523-6688. DE QUALQUER FORMA, FIQUEM SUPER À VONTADE PARA BUSCAR OUTRAS ALTERNATIVAS CONSIDERANDO A REGIÃO QUE DECIDIREM SE HOSPEDAR.",
  wedding_id: wedding.id
)
tip2.save!

# Create Weddings reviews
review1 = Review.new(
  content: "A Casa dos Noivos superou todas as minhas expectativas! Não só o site é incrivelmente fácil de usar, mas também possui um design elegante e moderno. Fiquei impressionado com a quantidade de recursos disponíveis, desde a criação de listas de presentes até o acompanhamento das confirmações de presença. Foi uma parte fundamental da minha jornada até o altar, e estou muito grato por isso!",
  rating: 5,
  user_id: user.id,
  wedding_id: wedding.id)
review1.save!
review2 = Review.new(
  content: "Minha experiência com a Casa dos Noivos foi excelente! O site oferece uma variedade de recursos úteis que realmente facilitaram a organização do meu casamento. Além disso, o suporte ao cliente foi incrível - sempre prontos para ajudar com qualquer dúvida ou problema. Estou muito satisfeito com o resultado final e definitivamente recomendaria a plataforma a outros casais!",
  rating: 4,
  user_id: user2.id,
  wedding_id: wedding2.id
)
review2.save!
review3 = Review.new(
  content: "Estou absolutamente encantado com a Casa dos Noivos! O site tornou toda a organização do meu casamento muito mais fácil e eficiente. Desde a criação do site personalizado até a gestão dos RSVPs dos convidados, tudo foi simples e intuitivo. Recomendo fortemente a todos os noivos que desejam uma experiência tranquila e sem complicações.",
  rating: 5,
  user_id: user3.id,
  wedding_id: wedding3.id
)
review3.save!
puts "Wedding reviews created"
# Create a list of gifts
gift_file1 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/Jantar_Romantico_uoozia.jpg")
gift_file2 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/Jantar_Copa_ziu51e.jpg")
gift_file3 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_paris_iccenx.jpg")
gift_file4 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_balao_b1pras.jpg")
gift_file5 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/mergulho_com_os_Golfinhos_psat5u.jpg")
gift_file6 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/passeio_aventura_ebresz.jpg")
gift_file7 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/coliseu_cis2kk.jpg")
gift_file8 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_car_vrfoyd.jpg")
gift_file9 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_maldivas_h4o8jh.jpg")
gift_file10 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_arizona_b3532r.jpg")
gift_file11 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/safari_u0klfe.jpg")
gift_file12 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/presentes_x8c9kp.jpg")
gift_file13 = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/praia_paradisiaca_pslfxo.jpg")

gift1 = Gift.new(title: "Jantar Romântico", category: "Jantar", value: 450, total_quota: 10, wedding_id: wedding.id)
gift1.photo.attach(io: gift_file1, filename: "", content_type: "image/png")
gift1.save!
gift2 = Gift.new(title: "Jantar no Copacabana Palace", category: "Jantar", value: 800, total_quota: 10, wedding_id: wedding.id)
gift2.photo.attach(io: gift_file2, filename: "", content_type: "image/png")
gift2.save!
gift3 = Gift.new(title: "Jantar em Paris", category: "Jantar", value: 1000, total_quota: 10, wedding_id: wedding.id)
gift3.photo.attach(io: gift_file3, filename: "", content_type: "image/png")
gift3.save!
gift4 = Gift.new(title: "Passeio de Balão", category: "Passeio", value: 750, total_quota: 10, wedding_id: wedding.id)
gift4.photo.attach(io: gift_file4, filename: "", content_type: "image/png")
gift4.save!
gift5 = Gift.new(title: "Mergulho com Golfinhos", category: "Passeio", value: 1200, total_quota: 10, wedding_id: wedding.id)
gift5.photo.attach(io: gift_file5, filename: "", content_type: "image/png")
gift5.save!
gift6 = Gift.new(title: "Passagem de lua de mel", category: "Viagem", value: 7000, total_quota: 10, wedding_id: wedding.id)
gift6.photo.attach(io: gift_file6, filename: "", content_type: "image/png")
gift6.save!
gift7 = Gift.new(title: "Passeio ao Coliseu", category: "Passeio", value: 1500, total_quota: 10, wedding_id: wedding.id)
gift7.photo.attach(io: gift_file7, filename: "", content_type: "image/png")
gift7.save!
gift8 = Gift.new(title: "Aluguel de carro", category: "Viagem", value: 2500, total_quota: 10, wedding_id: wedding.id)
gift8.photo.attach(io: gift_file8, filename: "", content_type: "image/png")
gift8.save!
gift9 = Gift.new(title: "Hospedagem em maldivas", category: "Viagem", value: 8500, total_quota: 10, wedding_id: wedding.id)
gift9.photo.attach(io: gift_file9, filename: "", content_type: "image/png")
gift9.save!
gift10 = Gift.new(title: "Hiking no Arizona", category: "Viagem", value: 5000, total_quota: 10, wedding_id: wedding.id)
gift10.photo.attach(io: gift_file10, filename: "", content_type: "image/png")
gift10.save!
gift11 = Gift.new(title: "Safari", category: "Viagem", value: 7999, total_quota: 10, wedding_id: wedding.id)
gift11.photo.attach(io: gift_file11, filename: "", content_type: "image/png")
gift11.save!
gift12 = Gift.new(title: "Presente ao casal", category: "Outros", value: 3500, total_quota: 10, wedding_id: wedding.id)
gift12.photo.attach(io: gift_file12, filename: "", content_type: "image/png")
gift12.save!
gift13 = Gift.new(title: "Passeio à Praia Paradisíaca", category: "Viagem", value: 1570, total_quota: 10, wedding_id: wedding.id)
gift13.photo.attach(io: gift_file13, filename: "", content_type: "image/png")
gift13.save!
puts "Gifts created"
# Create a list of guests with faker
Faker::Config.locale = 'pt-BR'
100.times do
  emails = ["@gmail.com", "@hotmail.com", "@yahoo.com.br"]
  special_caracters = ["í", "ã", "ç", "é", "õ", "ú", "ê", "á", "ó", "í", "ô"]
  full_name = "#{Faker::Name.first_name} #{Faker::Name.unique.last_name}"
  first_name = full_name.downcase.split(" ").first
  last_name = full_name.downcase.split(" ").last
  name = "#{first_name}_#{last_name}"

  if special_caracters.any? { |char| name.include?(char) }
    name = name.gsub("í", "i").gsub("ã", "a").gsub("ç", "c").gsub("é", "e").gsub("õ", "o").gsub("ú", "u").gsub("ê", "e").gsub("á", "a").gsub("ó", "o").gsub("í", "i").gsub("ô", "o")
  end
  guest = Guest.new(
    full_name: full_name,
    email: "#{name.downcase}#{emails.sample}",
    # phone: Faker::PhoneNumber.unique.cell_phone,
    phone: Faker::PhoneNumber.extension(length: 11),
    confirmed: [true, false, nil].sample,
    wedding_id: wedding.id
  )
  guest.save!
end

mensagens_confirmacao = [
  "Queridos noivos, é com grande alegria que confirmamos nossa presença no dia mais especial de suas vidas! Mal podemos esperar para compartilhar este momento único com vocês.",
  "Olá! Estamos muito felizes em poder participar do seu casamento e compartilhar desse momento tão especial com vocês. Podem contar conosco!",
  "Queridos amigos, estamos honrados em fazer parte deste dia tão importante para vocês. Com certeza estaremos lá para celebrar o amor e a união de vocês!",
  "Oi! Recebemos o convite e ficamos encantados em confirmar nossa presença no seu casamento. Será uma honra testemunhar o início dessa jornada ao lado de vocês.",
  "Queridos noivos, agradecemos do fundo do coração pelo convite e estamos radiantes em confirmar nossa presença. Mal podemos esperar para celebrar esse dia tão especial com vocês!"
]
guests_list = Guest.where(wedding: wedding.id).select { |guest| guest.confirmed == true && guest.confirmation_message == nil }

puts "Guests created"
# Imprime as mensagens de confirmação
mensagens_confirmacao.each do |mensagem|
  guest = guests_list.sample
  guest.confirmation_message = mensagem
  guest.save!
end
puts "Confirmation messages created"
# Create personalized list of guests
guest1 = Guest.new(
  full_name: "Josimar Machado",
  email: "josimar1@gmail.com",
  phone: "11907858264",
  confirmed: nil,
  wedding_id: wedding.id
)
guest1.save!

guest2 = Guest.new(
  full_name: "Riccieri Bosa",
  email: "riccieri1@gmail.com",
  phone: "21966394832",
  confirmed: nil,
  wedding_id: wedding.id
)
guest2.save!
puts "Personalized guests created"
# Create a list of orders
mensagens_para_noivos = [
    "Queridos Pedro e Maria, Estou emocionado por compartilhar este momento especial com vocês! Escolhi este presente com todo o carinho para celebrar o início da jornada de vocês juntos. Que cada dia seja tão cheio de amor e felicidade quanto este. Parabéns pelo casamento!",

    "Queridos amigos, Pedro e Maria, Que alegria poder celebrar o amor de vocês neste dia tão importante! Espero que este presente seja uma adição especial à vida que estão construindo juntos. Desejo-lhes uma vida repleta de risos, amor e cumplicidade. Felicidades!",

    "Caros Pedro e Maria, Estou encantado por testemunhar este capítulo incrível na vida de vocês! Este presente é apenas uma pequena lembrança do quanto desejo que a felicidade esteja sempre presente em suas vidas. Que o amor que compartilham só cresça com o tempo. Parabéns pelo casamento!",

    "Queridos noivos, Pedro e Maria, O dia do seu casamento é um momento tão especial e estou muito feliz por fazer parte dele. Espero que este presente traga ainda mais alegria e amor ao lar que estão construindo juntos. Que a jornada que estão começando seja repleta de memórias maravilhosas e momentos inesquecíveis. Felicidades!",

    "Meus queridos, Pedro e Maria, Que emocionante é poder celebrar o amor de vocês neste dia tão significativo! Este presente é um símbolo do quanto torço pela felicidade e prosperidade do casal. Que cada dia seja uma nova aventura cheia de amor e compreensão. Parabéns e felicidades!",

    "Queridos casal, Pedro e Maria, É com grande alegria que escolhi este presente para vocês. Que ele seja um lembrete constante do amor e do compromisso que compartilham. Que o casamento de vocês seja cheio de momentos mágicos e de união. Estou ansioso para celebrar muitas ocasiões felizes juntos!",

    "Meus amigos amados, Pedro e Maria, Estou tão feliz por ter a oportunidade de compartilhar este momento especial com vocês! Espero que este presente traga um sorriso aos seus rostos, assim como o amor de vocês traz ao meu. Que a vida a dois seja uma jornada incrível cheia de amor, compreensão e respeito mútuo. Parabéns pelo casamento!",

    "Caros amigos, Pedro e Maria, Que privilégio é poder fazer parte deste momento único na vida de vocês! Espero que este presente os acompanhe em todas as etapas da sua jornada juntos, lembrando-os sempre do amor que os uniu. Que o casamento de vocês seja um conto de fadas cheio de amor e cumplicidade. Felicidades!",

    "Queridos amigos, Pedro e Maria, Estou emocionado por celebrar este momento tão especial com vocês! Que este presente seja apenas o começo de uma vida cheia de alegria, amor e realizações compartilhadas. Que o casamento de vocês seja uma fonte constante de felicidade e inspiração. Parabéns e votos de felicidades eternas!",

    "Meus queridos amigos, Pedro e Maria, Neste dia tão marcante, desejo a vocês todo o amor e felicidade do mundo! Que este presente seja um símbolo do carinho e dos bons votos que tenho para o casal. Que a vida a dois seja repleta de momentos inesquecíveis e que cada dia fortaleça ainda mais o amor que os une. Parabéns pelo casamento!"
]
contador = 0
10.times do
  order = Order.new(
    gift_id: Gift.where(wedding: wedding.id).sample.id,
    full_name: Guest.where(wedding: wedding.id).sample.full_name,
    message: mensagens_para_noivos[contador]
  )
  order.save!
  contador += 1
  contador = 0 if contador == mensagens_para_noivos.length
end
puts "Orders created"
