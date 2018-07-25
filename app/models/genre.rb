# frozen_string_literal: true

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    all.find { |artist| artist.slug == slug }
  end
end
