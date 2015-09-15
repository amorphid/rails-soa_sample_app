class FetchRantsViaRantsApi
  RantsURI = URI("http://localhost:3002/rants")

  def fetch
    rants(
      json(RantsURI))
  end

  def json(uri)
    FetchJsonViaJsonApi.new.fetch(uri)
  end

  def rants(json)
    json.map do |rant_args|
      Rant.new(rant_args)
    end
  end
end
