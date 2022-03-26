# frozen_string_literal: true

class Movie

  attr_reader :id, :title, :genres, :summary, :vote_average, :duration, :minutes, :poster_path, :imdb_id, :release_year
  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @genres = data[:genres]
    @summary = data[:overview]
    @vote_average = data[:vote_average]
    @duration = time_format(data[:runtime])
    @minutes = data[:runtime]
    @poster_path = data[:poster_path]
    @imdb_id = data[:imdb_id]
    @release_year = data[:release_date][0..3]
  end

  def time_format(minutes)
    hours = minutes / 60
    min = minutes % 60
    "#{hours} hour(s) and #{min} minute(s)"
  end
end
