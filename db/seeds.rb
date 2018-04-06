User.create name: "Admin",
  email: "admin@framgia.com",
  password: "123456",
  permision: "1"

100.times do |index|
  Publisher.create name: FFaker::Internet.user_name
end

100.times do |index|
  Book.create name: FFaker::Education.degree_short,
    status: Random.rand(0..2),
    description: FFaker::Lorem.paragraph,
    number_page: Random.rand(1..1000),
    publisher_id: Random.rand(1..100),
    image_url: ""
end

10.times do |index|
  Category.create name: FFaker::Education.major
end
