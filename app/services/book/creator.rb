# https://www.honeybadger.io/blog/refactor-ruby-rails-service-object/
# Rules for Writing Good Service Objects
# Rule 1: One public method
# Rule 2: Name Service Objects According to the Role They Perform
# Rule 3: Do not instantiate service objects directly
# Rule 4: Group service objects in namespaces
# Rule 5: One responsibility per service object
# Rule 6: Rescue exceptions and raise custom exceptions
#
# References:
# # https://github.com/Selleo/pattern
#
# To call this service:
#
#   Book::Creator.call(
#     title: params[:title],
#     description: params[:description],
#     author_id: params[:author_id],
#     genre_id: params[:genre_id]
#   )
#
module Book
  class Creator < Patterns::Service
    def initialize(title:, description:, author_id:, genre_id:)
      @title = title
      @description = description
      @author_id = author_id
      @genre_id = genre_id
    end

    def call
      create_book
    end

    private

    def create_book
      Boook.create!(
        title: @title,
        description: @description,
        author_id: @author_id,
        genre_id: @genre_id
      )
    rescue ActiveRecord::RecordNotUnique => _exception
      # handle duplicate entry
    end
  end
end