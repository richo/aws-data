module AWSData

  Record = Struct.new("Record", :name, :finder)

  class Base

    class << self
      @base_path = nil
      def base_path(path)
        @base_path = path
      end

      def _base_path
        @base_path
      end
    end

    def initialize
      # Setup the finders, or throw an exception if their IP isn't routable
      unless self.class._base_path
        raise "Can't instanciate without a base_path"
      end

      methods = parse_endpoint_data(transport.get(self.class._base_path))

      methods.each do |m|
        method_name = m.name.gsub(/-/, "_").to_sym
        if m.finder
          eigenclass.send(:define_method, method_name) do
            Finder.new("#{self.class._base_path}/#{m.name}/")
          end
        else
          eigenclass.send(:define_method, method_name) do
            transport.get("#{self.class._base_path}/#{m.name}")
          end
        end
      end
    end

    def transport
      @transport ||= Transport.new
    end

    def parse_endpoint_data(data)
      ret = []
      data.split("\n").each do |el|
        if el.end_with? "/"
          el.gsub!(/\/$/, "")
          ret << Record.new(el, true)
        else
          ret << Record.new(el, false)
        end
      end
      return ret
    end

    def eigenclass
      class << self
        self
      end
    end

  end

  class Finder
    def self.new(path)
      Class.new(Base) do
        base_path(path)
      end.new
    end
  end
end
