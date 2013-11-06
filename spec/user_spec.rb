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
    comments << { "Title" => "Blade Runner", "Comment" => "My favorite movie" }
    expect(user.get_comments).to eq comments
  end
end

  