module AWSData
  class Metadata

    def latest
      transport.get("/latest/meta-data")
    end

    def transport
      @transport ||= Transport.new
    end
  end
end
