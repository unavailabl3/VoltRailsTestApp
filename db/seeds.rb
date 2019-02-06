example_account = true

10.times do
  if example_account
    user = User.create!(
      nickname: "example",
      email: "example@mail.com",
      password: "example"
    )
    example_account = false
  else
    user = User.create!(
      nickname: Faker::Witcher.character,
      email: Faker::Internet.email,
      password: "password"
    )
  end
  10.times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      published_at: rand(1.year.ago..Time.now),
      author: user.nickname
    )
    5.times do
      post.comments.create!(
        body: Faker::Lorem.question,
        author: user.nickname,
        published_at: post.published_at + 60*rand(1..60)
      )
    end
  end
end
