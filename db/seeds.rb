# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = open('http://tmdb.lewagon.com/movie/top_rated')
movie_library = JSON.parse(url.read)

movie_library["results"].each do |movie_hash|
  Movie.create(title: movie_hash['title'], overview: movie_hash['overview'], poster_url: "http://image.tmdb.org/t/p/w300/#{movie_hash['poster_path']}", rating: movie_hash['vote_average'])
end

List.create(name: 'favorites')
List.create(name: 'watched')
List.create(name: 'Not watched yet')
