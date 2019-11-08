class ConcertsController < ApplicationController
  PER = 12
  before_action :set_concert, only: [:edit, :update]
  before_action :set_concert_title, only: [:show, :destroy]
  before_action :user_signed_in? , only: [:new, :create, :edit, :update, :destroy]


  # GET /concerts
  def index
    @concert_all = Concert.all
    @concert_index = Concert.pluck(:title).uniq
  end

  # GET /concerts/1
  def show
    @concert_all = Concert.all
    @concert_title = @concert.pluck(:title).uniq
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
    @setlist_songs = []
  end

  # GET /concerts/1/edit
  def edit
    @concert_dates = @concert.setlists.order(date: :asc).pluck(:date).uniq
    @setlist_songs = @concert.songs.order(date: :asc , number: :asc)
  end

  # POST /concerts
  def create
    @concert = Concert.new(concert_params)
    params[:setlist1].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date1], number: index+1)
    }
    
    params[:setlist2].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date2], number: index+1)
    }

    params[:setlist3].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date3], number: index+1)
    }

    params[:setlist4].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date4], number: index+1)
    }

    params[:setlist5].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date5], number: index+1)
    }

    params[:setlist6].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date6], number: index+1)
    }

    params[:setlist7].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date7], number: index+1)
    }


    if @concert.save
      redirect_to @concert, notice: 'Concert was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /concerts/1
  def update
    @concert.setlists.destroy_all
    params[:setlist1].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date1], number: index+1)
    }

    params[:setlist2].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date2], number: index+1)
    }

    params[:setlist3].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date3], number: index+1)
    }

    params[:setlist4].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date4], number: index+1)
    }

    params[:setlist5].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date5], number: index+1)
    }

    params[:setlist6].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date6], number: index+1)
    }

    params[:setlist7].each_with_index { | song_id, index | 
      Setlist.create(song_id: song_id, concert_id: @concert.id, date: params[:date7], number: index+1)
    }
    
    if @concert.update(concert_params)
      redirect_to @concert, notice: 'Concert was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /concerts/1
  def destroy
    @concert.each do |concert|
      concert.destroy
    end
    redirect_to concerts_url, notice: 'Concert was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end
    
    def set_concert_title
      @concert = Concert.where(title: params[:title])
    end

    # Only allow a trusted parameter "white list" through.
    def concert_params
      params.require(:concert).permit(:title , :place)
    end
end
