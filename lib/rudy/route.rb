class Rudy
  class Route
    REQUEST_METHODS = %i[get post patch delete]
    attr_accessor :routes

    def initialize(&block)
      @routes = create_routes_base
      yield(self)
    end

    def get(path, action)
      add_route(:get, path, action)
    end

    private

    def add_route(method, path, action)
      @routes[method] << { path: path, action: action }
    end

    def create_routes_base
      REQUEST_METHODS.each_with_object({}) do |method, hash|
        hash[method] = []
      end
    end
  end
end
