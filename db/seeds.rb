range = (1..5).to_a

5.times do
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
  user.save!
end

10.times do
  jobs =Job.new(
    description: Faker::Lorem.paragraph,
    short_description: Faker::Lorem.sentence,
    category: Faker::Lorem.words,
    title: Faker::Name.title,
    remote: Faker::Boolean.boolean,
    finish: Faker::Boolean.boolean,
    address: Faker::Address.street_address,
    date: Faker::Date.forward(30),
    user_id: range.sample,
    picture: Faker::Avatar.image
  )
  jobs.save!
end
