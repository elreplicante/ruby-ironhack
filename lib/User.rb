class User
    attr_accessor :comments

    def initialize
        @comments = []
    end
    def new_comment title, comment
        user_comment = {}
        user_comment["Title"] = title
        user_comment["Comment"] = comment
        @comments << user_comment
    end
    def get_comments 
        @comments
    end
end