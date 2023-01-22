class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genre_all = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre_find = Genre.find(params[:id])
  end

  def update
    @genre_find = Genre.find(params[:id])
    @genre_find.update(genre_params)
    redirect_to admin_genres_path
  end
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
