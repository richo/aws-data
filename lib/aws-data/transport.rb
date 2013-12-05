require 'net/http'

module AWSData
  class Transport

    def get(path)
      uri = uri_for(path)
      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body)
      else
        raise "oops"
      end
    end

  private

    def uri_for(path)
      uri = URI("http://169.254.169.254")
      uri.path = path
      return uri
    end
  end
end
