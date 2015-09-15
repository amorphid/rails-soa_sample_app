class FetchBooksViaBooksApi
  BooksURI = URI("http://localhost:3001/books")

  def books(json)
    json.map do |book_args|
      Book.new(book_args)
    end
  end

  def fetch
    books(
      json(BooksURI))
  end

  def json(uri)
    FetchJsonViaJsonApi.new.fetch(BooksURI)
  end
end
