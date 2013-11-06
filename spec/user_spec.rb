require "rspec"
require_relative '../lib/User.rb'

user = User.new
user.favorite_a_movie("Spartacus")
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
    
    expect(user.favorite_movies).to include "Spartacus"
  end

  it "doesn't adds the movie if it is already favorited" do
    user.favorite_a_movie("Spartacus")
    expect(user.favorite_movies).to eq ["Spartacus"]
  end
end

describe "When calculating proximity between users" do
  it "if two users have the same favorited movie they have proximity factor 0" do
    user_prox_zero = User.new
    user_prox_zero.favorite_a_movie("Spartacus")
    expect(user.calculate_proximity(user_prox_zero)).to eq 0
    expect(user_prox_zero.calculate_proximity(user)).to eq 0
  end

  it "if two users don't have the same favorited movie they have proximity factor 10" do
    user_no_prox = User.new
    expect(user.calculate_proximity(user_no_prox)).to eq 10
    expect(user_no_prox.calculate_proximity(user)).to eq 10
  end
    
end
