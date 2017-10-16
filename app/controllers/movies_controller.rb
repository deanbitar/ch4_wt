# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  # in app/controllers/movies_controller.rb

=begin
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end
=end
  
  # in controller action:
  def show
    @movie = Movie.where(:id => params[:id]) # what if this movie not in DB?
    # BUG: we should check @movie for validity here!
  end
  
  # add below all other methods
  private

    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
    
    def new
      @movie = Movie.new
      # default: render 'new' template
    end
end