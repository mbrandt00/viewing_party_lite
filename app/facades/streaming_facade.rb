require './app/poros/streaming'

class StreamingFacade
attr_reader :reviews
  def initialize(movie_id)
    @reviews = []
    MovieService.reviews(movie_id)[:results].each do |review|
      @reviews << Review.new(review)
    end
  end
end