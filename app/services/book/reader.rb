module Book
  class Reader < Patterns::Service
    def initialize(book)
      @book = book
    end

    def call
      # do something
    end
  end
end