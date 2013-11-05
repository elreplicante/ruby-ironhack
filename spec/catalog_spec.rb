require "rspec"
require_relative "../Catalog.rb"
require_relative "../Movie.rb"



catalog = Catalog.new

describe "A movies catalog" do
  it "should show no movies when empty" do
    expect(catalog.show_movies).to eq []
  end

  it "should show a movie after adding it" do
    mock_movie = Movie.new "Blade Runner", "Sci-Fi", 1978
    catalog.add_movie mock_movie
    expect(catalog.show_movies).to eq [mock_movie]        
  end
end