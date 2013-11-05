class Catalog
    attr_accessor :movies

    def initialize(movies = [])
        @movies = movies
    end

    def show_movies
        @movies
    end

    def add_movie movie
        @movies << movie
    end
end