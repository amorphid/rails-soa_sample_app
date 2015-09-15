class FetchJsonViaJsonApi
  CONTENT_TYPE = 'application/json'

  def body(response)
    response.body
  end

  def fetch(uri)
    json(
      body(
        response(
          request(
            params(uri)))))
  end

  def request(content_type:, uri:)
    Net::HTTP::Get.new(uri).tap do |request|
      request.content_type = content_type
    end
  end

  def json(body)
    JSON.parse(body)
  end

  def params(uri)
    {
      uri: uri,
      content_type: CONTENT_TYPE
    }
  end

  def response(request)
    Net::HTTP.start(request.uri.hostname, request.uri.port) do |http|
      http.request(request)
    end
  end
end
