require 'open-uri'
require "nokogiri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

User.create!(
  email: "truc@truc.com",
  password: "123456"
)

User.create!(
  email: "trucmuche@truc.com",
  password: "123456"
)

User.create!(
  email: "machintruc@truc.com",
  password: "123456"
)

all_types = %w[acier combat dragon eau électrik feu fée glace insecte normal plante poison psy roche sol spectre ténèbres vol]

url = "https://eternia.fr/fr/pokedex/liste-pokemon/"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
i = 0
e = ""
html_doc.search("tr").each do |element|
  next if element.children[1].name == "th"
  next if e == element.children[1].text

  e = element.children[1].text
  pokemon = Pokemon.new(
    name: element.children[5].children.first.text,
    price_per_day: rand(50)
  )
  types = []
  element.search('span').each do |e|
    types << e.attributes.values.first.value if all_types.include?(e.attributes.values.first.value)
  end
  href_poster = element.children[5].children.first.attribute('href').value
  url_poster = "https://eternia.fr#{href_poster}"
  poster_file = URI.open(url_poster).read
  poster_doc = Nokogiri::HTML(poster_file)

  photo = poster_doc.search('.artwork_off > img').each do |i|
    i.attributes.values.first.value
  end

  pokemon.types = types
  pokemon.poster_url = "https://eternia.fr#{photo}"
  pokemon.user = User.all.sample

  pokemon.save!
  puts "#{pokemon.name} has been created !"
  e = element.children[1].text
  i += 1
  break if i == 50
end
