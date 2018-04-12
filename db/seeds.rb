User.create name: "Admin",
  email: "admin@framgia.com",
  password: "123456",
  permision: "admin"

50.times do |index|
  User.create name: FFaker::Name.name_with_prefix_suffix,
    email: "example-#{index+1}@gmail.com",
    password: "123456"
end

10.times do |index|
  Publisher.create name: FFaker::Internet.user_name
end

10.times do |index|
  Author.create name: FFaker::Name.name_with_prefix_suffix
end

50.times do |index|
  Book.create name: FFaker::Education.degree_short,
    status: "available",
    description: FFaker::Lorem.paragraph,
    number_page: Random.rand(1..1000),
    publisher_id: Random.rand(1..100),
    image_url: ""
end

10.times do |index|
  Category.create name: FFaker::Education.major
end

20.times do |index|
  Rate.create user_id: Random.rand(1..100),
    book_id: Random.rand(1..100),
    rate: false
end

20.times do |index|
  RequestBook.create user_id: Random.rand(1.100),
    book_id: Random.rand(1..100),
    date_begin: DateTime.new(2018, 4, 6),
    date_end: DateTime.new(2018, 4, 22),
    date_return: DateTime.new(2018, 4, 16)
end

20.times do |index|
  Review.create user_id: Random.rand(1..100),
    book_id: Random.rand(1..100),
    content: FFaker::Lorem.paragraph
end


