class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # 获取参数
    sort = params[:sort] || session[:sort] || {}
    # 根据参数设置header的类和排序情况
    case sort
    when 'title'
      ordering, @title_header = {:order => :title}, 'hilite'
    when 'release_date'
      ordering, @date_header = {:order => :release_date}, 'hilite'
    end
    # 获取所有的电影
    @movies = Movie.all
    # 处理评级选择
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}

    # 默认选择全部
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end

    # 处理session和param的冲突
    # 以下是点击了排序按钮
    if params[:sort] != session[:sort]
      session[:sort] = sort
    end
    # 以下是点击了选择评级按钮
    if params[:ratings] != session[:ratings] and @selected_ratings != {}
      session[:sort] = sort
      session[:ratings] = @selected_ratings
    end

    if sort != {}
      @movies = Movie.where("rating": @selected_ratings.keys).order(ordering[:order])
    else
      @movies = Movie.where("rating": @selected_ratings.keys)
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
