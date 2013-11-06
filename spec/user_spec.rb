require "rspec"
require_relative '../lib/User.rb'

user = User.new
user.favorite_a_movie("Spartacus")
user.favorite_a_movie("Toy Story")
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
    expect(user.favorite_movies).to eq ["Spartacus", "Toy Story"]
  end
end

describe "When calculating proximity between users" do
  user_prox_zero = User.new
  user_prox_zero.favorite_a_movie("Spartacus")
  it "they have proximity factor 0 if they have the same favorited movie " do
    
    expect(user.proximity(user_prox_zero)).to eq 0
    expect(user_prox_zero.proximity(user)).to eq 0
  end

  it "they have proximity factor 10 if they don't have any shared favorited movie " do
    user_no_prox = User.new
    expect(user.proximity(user_no_prox)).to eq 10
    expect(user_no_prox.proximity(user)).to eq 10
  end
    
  it "they have proximity factor 1 if they don't share movies but they do share a favorite moviewith a third user" do
    user_prox_one = User.new
    user_prox_one.favorite_a_movie "Toy Story"
    expect(user.proximity(user_prox_one, user_prox_zero)).to eq 1
  end
end


