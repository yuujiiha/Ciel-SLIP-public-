class Concert < ApplicationRecord
    has_many :setlists
    has_many :songs, through: :setlists
end
