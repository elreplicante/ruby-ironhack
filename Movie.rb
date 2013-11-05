class Movie
    attr_accessor :title, :genre, :year

    def initialize title = "", genre = "", year = 1900
        @title = title
        @genre = genre
        @year = year
    end

    def self.ordered_movies movies
        movies.sort_by! { |movie| movie.title }
    end

    def self.last_movies movies
        last_movies = []
        movies.reverse[0..4].each { |movie| last_movies << movie }
        last_movies = self.ordered_movies last_movies
    end

    def self.get_histogram movies, year
        result = []
        movies.each { |movie| movie.year == year ? result << movie : result }
        result
    end

#todo
    def self.get_genre_count movies
        result = {}
        movies.each { |movie| result[movie.genre] = movies.count("#{movie.genre}") }
        result
    end
end
