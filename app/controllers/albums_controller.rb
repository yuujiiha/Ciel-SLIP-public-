class AlbumsController < ApplicationController
  PER = 12
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in? , only: [:new, :create, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    #@albums = Album.page(params[:page]).per(PER)
  end

  def albums_index
    @albums = Album.where(single: false).page(params[:page]).per(PER)
    @is_album = true
    render action: :index
  end
  
  def singles_index
    @albums = Album.where(single: true).page(params[:page]).per(PER)
    @is_album = false
    render action: :index
  end
  
  # GET /albums/1
  # GET /albums/1.json
  def show
    
  end

  # GET /albums/new
  def new
    @album = Album.new
    @recorded_songs = []
  end

  # GET /albums/1/edit
  def edit
    @recorded_songs = @album.songs.order(number: :asc)
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    params[:recorded_songs].each_with_index { | song_id, index | 
      AlbumSong.create(song_id: song_id, album_id: @album.id, number: index+1)
    }
    
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    edit_album = Album.find(params[:id])
    edit_album.album_songs.destroy_all
    params[:recorded_songs].each_with_index { | song_id, index | 
      AlbumSong.create(song_id: song_id, album_id: edit_album.id, number: index+1)
    }
    
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to "/music", notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :release, :single)
    end
end
