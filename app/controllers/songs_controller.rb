class SongsController < ApplicationController
  # before_filter :some_method
  #
  # def some_method
  #   puts "this goes before every method"
  # end


  def index
    session[:counter] ||= 0
    @counter = session[:counter] += 1
    @songs = Song.all
  end

  def new
    #can be empty b/c we don't need to gather data
    @song = Song.new # add to use partials
  end


  def show
    @song = Song.find(params[:id])
  end

  def create
    #Song.create(params[:song])
    song = Song.new(song_params)
    #based on validations
    if song.save
      redirect_to song_path(song)
    else
      # render 'new' both work symbol is used more
      render :new #render the new page(create page) again
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  # sets strong params
  def song_params
    params.require(:song).permit(:title, :artist)
  end
end


#
#
# class SongsController < ApplicationController
#   def index
#     @songs = Song.all
#   end
#
#   def show
#     @song = Song.find(params[:id])
#   end
#
#   def new
#     @song = Song.new
#   end
#
#   def create
#
#     #below is the actual way
#     song = Song.new(song_params)
#     if song.save
#       redirect_to song_path(song) #or just type song
#     else
#       render :new
#     end
#   end
#
#   def edit
#     @song = Song.find(params[:id])
#   end
#
#   def update
#     @song = Song.find(params[:id])
#     if @song.update(song_params)
#       redirect_to song_path(@song)
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @song = Song.find(params[:id])
#     @song.destroy
#     redirect_to songs_path
#   end
#
#   private
#
#   def song_params
#     params.require(:song).permit(:title, :artist)
#   end
#
#
# end
