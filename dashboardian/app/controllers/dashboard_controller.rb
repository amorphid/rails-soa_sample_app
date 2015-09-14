class DashboardController < ApplicationController
  def index
    uri = URI('http://localhost:3001/rants')
    request = Net::HTTP::Get.new(uri)
    request.content_type = 'application/json'
    response = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(request) }
  end
end
