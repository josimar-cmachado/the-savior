# require "open-uri"
5.times do
  Guest.create!(full_name: Faker::Name.name, email: Faker::Internet.email, confirmed: false, phone: Faker::PhoneNumber.cell_phone, wedding_id: 5)
end

# 5.times do
#   Gift.create!(title: Faker::Commerce.product_name, category: Faker::Commerce.department, value: Faker::Number.number(2), total_quota: Faker::Number.number(2), wedding_id: 5)
# end

# gif_file = URI.open("https://res.cloudinary.com/dqfjzvzr0/image/upload/v1617220733/gifts/coliseu.png")

# gift1= Gift.new!(title: "Jantar Romântico", category: "Jantar", value: 1000, total_quota: 10)
# gift1.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift1.save!
# gift2= Gift.new!(title: "Jantar no Veleiro", category: "Jantar", value: 2000, total_quota: 10)
# gift2.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift2.save!
# gift3= Gift.new!(title: "Jantar Copacabana Palace ", category: "Jantar", value: 3000, total_quota: 10)
# gift3.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift3.save!
# gift4= Gift.new!(title: "Jantar Paris City Vision ", category: "Jantar", value: 4000, total_quota: 10)
# gift4.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift4.save!
# gift5= Gift.new!(title: "Passeio de Balão", category: "Passeio", value: 5000, total_quota: 10)
# gift5.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift5.save!
# gift6= Gift.new!(title: "Mergulho com Golfinhos", category: "Passeio", value: 6000, total_quota: 10)
# gift6.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift6.save!
# gift7= Gift.new!(title: "Passeio de Aventura", category: "Passeio", value: 7000, total_quota: 10)
# gift7.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift7.save!
# gift8= Gift.new!(title: "Salto de Paraquedas", category: "Passeio", value: 8000, total_quota: 10)
# gift8.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift8.save!
# gift9= Gift.new!(title: "Visita ao Coliseo", category: "Viagem", value: 9000, total_quota: 10)
# gift9.photo.attach(io: gift_file, filename: "coliseu.png", content_type: "image/png")
# gift9.save!
# gift10= Gift.new!(title: "Aluguel de Carro", category: "Viagem", value: 10000, total_quota: 10)
# gift10.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift10.save!
# gift11= Gift.new!(title: "Estadia Maldivas", category: "viagem", value: 11000, total_quota: 10)
# gift11.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift11.save!
# gift12= Gift.new!(title: "Visita ao Deserto", category: "Viagem", value: 12000, total_quota: 10)
# gift12.photo.attach(io: gift_file, filename: "", content_type: "image/png")
# gift12.save!
