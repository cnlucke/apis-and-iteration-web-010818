require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character="Luke Skywalker")
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)


  charArr = character_hash["results"].select do |char|
    char["name"]== character
  end

  if charArr.any?
    films = []

    charArr[0]["films"].each do |film|
      films << JSON.parse(RestClient.get(film))
      end

      films
  else

  end
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  movies = []

  films_hash.each do |film|
    movies << film["title"]
  end

  movies
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)

  if films_hash
    parse_character_movies(films_hash)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
