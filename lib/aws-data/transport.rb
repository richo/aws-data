require 'net/http'

module AWSData
  class EndpointUnavailable < Exception
  end

  class Transport

    ENDPOINT_IP = "169.254.169.254"

    def get(path)
      uri = uri_for(path)
      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        return res.body
      else
        raise EndpointUnavailable
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
