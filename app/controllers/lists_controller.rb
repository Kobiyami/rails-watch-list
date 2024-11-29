class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
    @movies = Movie.all
    @bookmarks = Bookmark.all
    # raise

  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end

end
