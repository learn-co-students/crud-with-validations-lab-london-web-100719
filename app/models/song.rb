class Song < ApplicationRecord
  validates :title, presence: true
  #validate :title_is_unique?
  validates :title, uniqueness: { scope: :release_year, message: "songs must be unique per year" }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: ->{ released }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: -> { released }

  # with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numericality: {
  #     less_than_or_equal_to: Date.today.year
  #   }
  # end

  # def released?
  #   released
  # end

  # def title_is_unique?
  #   artists_songs = Song.all.select {|song| song.artist_name == self.artist_name }
  #   years_songs = artists_songs.select {|song| song.release_year == self.release_year }
  #   songs_titles = years_songs.map {|song| song.title }
  #   !songs_titles.include?(self.title)
  # end
end
