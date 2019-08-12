class Rudy
  class Router
    attr_reader :routes

    def initialize(routes)
      @routes = routes
    end

    def resolve(env)
      if route = find_route(env)
        control(route[:action]).call
      else
        Rudy::Controller.new.not_found
      end

    rescue Exception => error
      puts error.message
      puts error.backtrace
      Rudy::Controller.new.internal_error
    end

    private

    def find_route(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      method_routes = routes[method]
      request_path = env['REQUEST_PATH']

      method_routes.select { |hash| hash[:path] == request_path }.first
    end

    def control(route_value)
      controller_name, action_name = route_value.split('#')
      klass = Object.const_get "#{controller_name.capitalize}Controller"
      klass.new(name: controller_name, action: action_name.to_sym)
    end
  end
end
