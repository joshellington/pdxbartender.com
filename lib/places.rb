class Places

  def initialize(key)
    @@key = key
  end

  def get(id)
    if id.nil?
      "no id"
    else
      data = legwork(URI.parse(URI.encode("https://maps.googleapis.com/maps/api/place/details/json?sensor=false&reference="+id+"&key="+@@key)))
      JSON.parse(data)
    end
  end

  def legwork(uri = nil)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    body = response.body
  end

end