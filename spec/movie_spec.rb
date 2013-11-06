require 'rspec'
require_relative '../lib/Movie.rb'




describe "When adding comments to a movie" do
  movie = Movie.new "Spartacus", "Action", 1960

  before(:each) do
    movie.delete_comments
  end

  it "shows two comments when another comment is added" do
    movie.add_comment "This is a comment", "This is another comment"
    comments =  ["This is a comment", "This is another comment"] 
    expect(movie.get_comments).to eq comments
  end

  it "shows one comment when one comment is added" do
    movie.add_comment "This is a comment"
    comments =  ["This is a comment"] 
    expect(movie.get_comments).to eq comments
  end

  it "shows three comments if a third comment is added" do
    movie.add_comment "This is a comment", "This is another comment", "This is the third comment"
    comments = ["This is a comment", "This is another comment", "This is the third comment"]
    expect(movie.get_comments).to eq comments
  end
end

describe "When a movie is shown" do
  movie = Movie.new "Spartacus", "Action", 1960

  movie.add_comment  "This is a comment"
  info = movie.show_info

  it "contains the title" do    
    expect(info[:title]).to eq "Spartacus"
  end

  it "contains the genre" do
    expect(info[:genre]).to eq "Action"
  end

  it "containts the year" do
    expect(info[:year]).to eq 1960
  end
  
  it "contains comment" do
    expect(info[:comments]).to eq ["This is a comment"]
  end
end