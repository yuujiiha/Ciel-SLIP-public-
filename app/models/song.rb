class Song < ApplicationRecord
    has_many :album_songs
    has_many :albums, through: :album_songs
    has_many :setlists
    has_many :concerts, through: :setlists
end
