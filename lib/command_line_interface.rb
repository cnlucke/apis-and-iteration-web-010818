def welcome
  # puts out a welcome message here!
  puts "Welcome! Are you ready to look up Star Wars movies by character?"
  puts
end

def get_character_from_user
  puts "Please enter a character:"
  # use gets to capture the user's input. This method should return that input, downcased.
  response = gets.chomp
end

def print_movies(movies)
  puts
  if movies.nil?
    puts "Sorry, that character does not exist."
    puts
  else
    movies.each { |movie| puts movie }
  end
end
