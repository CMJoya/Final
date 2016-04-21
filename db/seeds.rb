Profession.create(name: 'Attorney')
Profession.create(name: 'Physician')

50.times do
  Professional.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      address: Faker::Address.city,
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: Faker::Internet.email,
                      bio: Faker::Lorem.paragraph,
                      profession_id: 2,
                      average_rating: 4)
end
50.times do
  Professional.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      address: Faker::Address.city,
                      phone_number: Faker::PhoneNumber.phone_number,
                      email: Faker::Internet.email,
                      bio: Faker::Lorem.paragraph,
                      profession_id: 1,
                      average_rating: 4)
end
