class Movie
    attr_accessor :title, :comments

    def initialize title, genre, year
        @title = title
        @genre = genre
        @year = year
        @comments = []
    end

    def delete_comments
        @comments = []
    end

    def add_comment *comment
        @comments += comment
    end
    
    def get_comments
        @comments
    end

    def show_info
        movie_info = {
            :title => @title,
            :genre => @genre,
            :year => @year,
            :comments => @comments
        }
        movie_info
    end
end