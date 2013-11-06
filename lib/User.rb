class User
    attr_accessor :comments, :favorite_movies


    def initialize
        @comments = []
        @favorite_movies = []
    end

    def new_comment title, comment
        user_comment = {
            title: title,
            comment: comment

        }
        
        @comments << user_comment
    end

    def get_comments 
        @comments
    end

    def favorite_a_movie movie_title
        unless @favorite_movies.include? movie_title
            @favorite_movies << movie_title
        end
    end

    

    def proximity *users
        if users.length == 1
            calculate_proximity(users[0])
        else
            if calculate_proximity(users[0]) == 0 && calculate_proximity(users[1]) == 0
             if users[0].proximity(users[1]) == 10
               return 1
            end
          end
        end    
    end

    private

    def calculate_proximity user
        factor = 10
        @favorite_movies.each do |movie|
            if user.favorite_movies.include? movie   
                factor = 0
            end
        end
        factor
    end
end