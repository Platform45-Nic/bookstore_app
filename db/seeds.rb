# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_users
  user_id = 0
  25.times do 
    User.create(
      first_name: "test#{user_id}",
      last_name: "LN#{user_id}test",
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456'
    )
    user_id = user_id + 1
  end
end

def seed_genres
  user_id = 0
  hobby = ['Arts', 'Crafts', 'Sports', 'Sciences', 'Collecting', 'Reading', 'Other']
  study = ['Arts and Humanities', 'Physical Science and Engineering', 'Math and Logic',
          'Computer Science', 'Data Science', 'Economics and Finance', 'Business',
          'Social Sciences', 'Language', 'Other']
  team = ['Study', 'Development', 'Arts and Hobby', 'Other']

  hobby.each do |name|
    Genre.create(name: name, created_by_id: user_id = user_id + 1)
  end

  study.each do |name|
    Genre.create(name: name, created_by_id: user_id = user_id + 1)
  end

  team.each do |name|
    Genre.create(name: name, created_by_id: user_id = user_id + 1)
  end
end

def seed_books
  genres = Genre.all
  user_id = 0
  genre_id = 3
  genres.each do |genre|
    5.times do
      Book.create(
        title: Faker::Lorem.sentences[0], 
        author_id: user_id = user_id + 1, 
        genre_id: genre_id = genre_id + 1, 
        description: Faker::Lorem.sentences[1]
      )
    end
  end
end

seed_users
seed_genres
seed_books
