
users = []

7.times do
  user = User.new(
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456",
      name: Faker::Name.name,
      birthday: Faker::Date.backward(10000),
      city: Faker::Address.city,
      picture: Faker::Avatar.image,
      about: Faker::Lorem.sentence
  )
  users << user
  user.save!
end

20.times do
  category_list = ["Educação","Crianças e jovens", "Defesa de direitos", "Meio Ambiente", "Pessoas com Deficiência", "Proteção Animal", "Saúde", "Combate à Pobreza"]
  jobs =Job.new(
    description: Faker::Lorem.paragraph,
    short_description: Faker::Lorem.sentence,
    category: category_list.sample, #Faker::Lorem.words,
    title: Faker::Name.title,
    remote: Faker::Boolean.boolean,
    finish: Faker::Boolean.boolean,
    address: Faker::Address.street_address,
    date: Faker::Date.forward(30),
    user: users.sample, #rails understand that this 'user' is 'user_id'
    picture: Faker::Avatar.image
  )
  jobs.save!
end

