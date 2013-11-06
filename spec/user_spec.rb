require "rspec"
require_relative '../lib/User.rb'

user = User.new
comments = [{
        :title => "Spartacus",
        :comment => "Awesome movie!"
    }]

describe "When a user comments" do
  
  it "contains the comment info" do
    user.new_comment "Spartacus", "Awesome movie!"
    expect(user.get_comments).to eq comments
  end

  it "contains all the comments info" do
    user.new_comment "Blade Runner", "My favorite movie"
    comments << { :title => "Blade Runner", :comment => "My favorite movie"}
    expect(user.get_comments).to eq comments
  end
end

describe "When a user favorites a movie" do
  it "the movie is included in the favorites list" do
    user.favorite_a_movie("Spartacus")
    expect(user.favorite_movies).to include "Spartacus"
  end

  it "doesn't adds the movie if it is already favorited" do
    user.favorite_a_movie("Spartacus")
    expect(user.favorite_movies).to eq ["Spartacus"]
  end
end

describe "When two users have the same favorite" do
  it "they have proximity factor 0" do
    user_prox_zero = User.new
    user_prox_zero.favorite_a_movie("Spartacus")
    expect(user.calculate_proximity(user)).to eq 0
  end
end
