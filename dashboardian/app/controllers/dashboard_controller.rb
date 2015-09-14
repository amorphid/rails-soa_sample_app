class DashboardController < ApplicationController
  def index
    uri = URI('http://localhost:3001/rants')
    request = Net::HTTP::Get.new(uri)
    request.content_type = 'application/json'
    rants = JSON.parse(Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(request) }.body)

    uri = URI('http://localhost:3002/books')
    request = Net::HTTP::Get.new(uri)
    request.content_type = 'application/json'
    books = JSON.parse(Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(request) }.body)

    @presenter = {
      books: books,
      rants: rants
    }
  end
end
