json.extract! song, :id, :title, :release, :created_at, :updated_at
json.url song_url(song, format: :json)
