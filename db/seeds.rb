require "open-uri"
User.destroy_all
Wedding.destroy_all
Gift.destroy_all
couple_photo = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/imag_foto_casal_bvhsar.jpg")
user_photo = URI.open("https://res.cloudinary.com/dqswoqgtn/image/upload/Gifs_photos/img_user.jpg")
user= User.new(email: "riccieri@yahoo.com", password: "123456", first_name: "Pedro", last_name: "Guimaraes", phone: "21999999999")
user.photo.attach(io: user_photo, filename: "", content_type: "image/png")
user.save!
wedding = Wedding.new(welcome_message: "Bem-vindos ao nosso site de casamento! Aqui vocês encontrarão todas as informações sobre o nosso grande dia. Estamos muito felizes em compartilhar esse momento com vocês. Agradecemos por todo o carinho e apoio que temos recebido. Contamos com a presença de todos vocês para celebrar conosco. Beijos, Maria e Pedro",
date: "Wed, 14 Aug 2024",
address: "Rio de Janeiro",
wedding_info: "A cerimônia será realizada na Igreja Nossa Senhora da Paz, no Leblon, às 16h. A festa será no Copacabana Palace, às 20h.",
user_id: User.last.id,
time: "Wed, 14 Aug 2024 02:09:00.000000000 UTC +00:00",
partner_email: "rr@gmail.com",
partner_profile: "noiva",
partner_first_name: "Maria",
partner_last_name: "Cristina",
partner_phone: "21999999988")
wedding.couple_photo.attach(io: couple_photo, filename: "", content_type: "image/png")
wedding.save!


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

gift1= Gift.new(title: "Jantar Romântico", category: "Jantar", value: 1000, total_quota: 10, wedding_id:Wedding.last.id)
gift1.photo.attach(io: gift_file1, filename: "", content_type: "image/png")
gift1.save!
gift2= Gift.new(title: "Jantar Copacabana Palace", category: "Jantar", value: 2000, total_quota: 10, wedding_id:Wedding.last.id)
gift2.photo.attach(io: gift_file2, filename: "", content_type: "image/png")
gift2.save!
gift3= Gift.new(title: "Jantar Paris City Vision ", category: "Jantar", value: 3000, total_quota: 10, wedding_id:Wedding.last.id)
gift3.photo.attach(io: gift_file3, filename: "", content_type: "image/png")
gift3.save!
gift4= Gift.new(title: "Passeio de Balão", category: "Passeio", value: 5000, total_quota: 10, wedding_id:Wedding.last.id)
gift4.photo.attach(io: gift_file4, filename: "", content_type: "image/png")
gift4.save!
gift5= Gift.new(title: "Mergulho com Golfinhos", category: "Passeio", value: 6000, total_quota: 10, wedding_id:Wedding.last.id)
gift5.photo.attach(io: gift_file5, filename: "", content_type: "image/png")
gift5.save!
gift6= Gift.new(title: "Passeio de Aventura", category: "Passeio", value: 7000, total_quota: 10, wedding_id:Wedding.last.id)
gift6.photo.attach(io: gift_file6, filename: "", content_type: "image/png")
gift6.save!
gift7= Gift.new(title: "Viagem ao coliseu", category: "Passeio", value: 8000, total_quota: 10, wedding_id:Wedding.last.id)
gift7.photo.attach(io: gift_file7, filename: "", content_type: "image/png")
gift7.save!
gift8= Gift.new(title: "Aluguel de carro", category: "viagem", value: 4000, total_quota: 10, wedding_id:Wedding.last.id)
gift8.photo.attach(io: gift_file8, filename: "", content_type: "image/png")
gift8.save!
gift9= Gift.new(title: "Viagem maldivas", category: "Viagem", value: 9000, total_quota: 10, wedding_id:Wedding.last.id)
gift9.photo.attach(io: gift_file9, filename: "", content_type: "image/png")
gift9.save!
gift10= Gift.new(title: "Viagem ao deserto", category: "Viagem", value: 10000, total_quota: 10, wedding_id:Wedding.last.id)
gift10.photo.attach(io: gift_file10, filename: "", content_type: "image/png")
gift10.save!
gift11= Gift.new(title: "Safari", category: "viagem", value: 11000, total_quota: 10, wedding_id:Wedding.last.id)
gift11.photo.attach(io: gift_file11, filename: "", content_type: "image/png")
gift11.save!
gift12= Gift.new(title: "Presente ao casal", category: "Outros", value: 12000, total_quota: 10, wedding_id:Wedding.last.id)
gift12.photo.attach(io: gift_file12, filename: "", content_type: "image/png")
gift12.save!
gift13= Gift.new(title: "Praia Paradisiaca", category: "Viagem", value: 13000, total_quota: 10, wedding_id:Wedding.last.id)
gift13.photo.attach(io: gift_file13, filename: "", content_type: "image/png")
gift13.save!
