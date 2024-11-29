class BookmarksController < ApplicationController

  # GET /lists/new
  def new
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST /lists or /lists.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end

end
