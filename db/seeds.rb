5.times do
  Guest.create!(full_name: Faker::Name.name, email: Faker::Internet.email, confirmed: false, phone: Faker::PhoneNumber.cell_phone, wedding_id: 5)
end

# 5.times do
#   Gift.create!(title: Faker::Commerce.product_name, category: Faker::Commerce.department, value: Faker::Number.number(2), total_quota: Faker::Number.number(2), wedding_id: 5)
# end
