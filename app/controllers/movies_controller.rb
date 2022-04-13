class MoviesController < ApplicationController
  def index
    # if params[:query].present?
      # @movies = Movie.where(title: params[:query])
    #   sql_query = "title ILIKE :query OR synopsis ILIKE :query"
    #   @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @movies = Movie.all
    # end
    # if params[:query].present?
    #   sql_query = " \
    #     movies.title ILIKE :query \
    #     OR movies.synopsis ILIKE :query \
    #     OR directors.first_name ILIKE :query \
    #     OR directors.last_name ILIKE :query \
    #   "
    #   @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @movies = Movie.all
    # end
    if params[:query].present?
      sql_query = " \
        movies.title @@ :query \
        OR movies.synopsis @@ :query \
        OR directors.first_name @@ :query \
        OR directors.last_name @@ :query \
      "
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
