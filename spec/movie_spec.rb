require "rspec"
require_relative "../Movie.rb"

spartacus = Movie.new("Spartacus", "Action", 1960)
blade_runner = Movie.new("Blade Runner", "Sci-Fi", 1978)
the_shinning = Movie.new("The Shining", "Terror", 1964)
star_wars = Movie.new("Star Wars", "Sci-Fi", 1978)

describe "Showing movies in the homepage" do
    
    it "should list three movies in the frontpage if 3 movies are saved" do
        movies = [spartacus, blade_runner, the_shinning]
        last_movies = Movie.last_movies movies
        expect(last_movies).to eq [blade_runner,spartacus, the_shinning]
    end
 
    it "should list one movie in the frontpage if 1 movies are saved" do
        movies = [spartacus]
        last_movies = Movie.last_movies movies 
        expect(last_movies).to eq [spartacus]
    end

   it "should list just 5 movies if more than 5 movies are saved" do
      movies = [spartacus, spartacus, spartacus, spartacus, spartacus, spartacus]
      last_movies = Movie.last_movies movies
      expect(last_movies).to eq [spartacus, spartacus, spartacus, spartacus, spartacus]
    end
end

describe "Showing the histogram" do
    it "should show no info if no movies are saved" do
      movies = []
      expect(Movie.get_histogram(movies, 1980)).to eq []
    end

    it "should show no info if there is no movie of this year" do
      movies = [spartacus]
      result = []
      expect(Movie.get_histogram(movies, 1980)).to eq result
    end
    
    it "should show a movie if there is one movie this year" do
        movies = [spartacus]
        result = [spartacus]
        expect(Movie.get_histogram(movies, 1960)).to eq result
    end

    it "should show all movies of a year" do
        movies = [spartacus, star_wars, blade_runner]
        result = [star_wars, blade_runner]
        expect(Movie.get_histogram(movies, 1978)).to eq result
    end

    it "should show the right genre count" do
      movies = [spartacus, star_wars, blade_runner]
      result = {"Sci-Fi" => 2}
      list = Movie.get_histogram(movies, 1978)
      expect(Movie.get_genre_count(list)).to eq result
    end
end