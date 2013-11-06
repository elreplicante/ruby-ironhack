require "rspec"
require_relative '../lib/User.rb'

user = User.new
comments = [{
        "Title" => "Spartacus",
        "Comment" => "Awesome movie!"
    }]


describe "When a user comments" do
  
  it "contains the comment info" do
    user.new_comment "Spartacus", "Awesome movie!"
    expect(user.get_comments).to eq comments
  end

  it "contains all the comments info" do
    user.new_comment "Blade Runner", "My favorite movie"
    comments << { "Title" => "Blade Runner", "Comment" => "My favorite movie"}
    expect(user.get_comments).to eq comments
  end
end

describe "When a user favorites a movie" do
  it "the movie is favorited for that user" do
    user.favorite_a_movie("Spartacus")
    expect(user.favorite_movies).to eq ["Spartacus"]
  end
end
