class Router
  attr_reader :routes

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    path = env['REQUEST_PATH']

    if routes.key?(path)
      control(routes[path]).call
    else
      Controller.new.not_found
    end

  rescue Exception => error
    puts error.message
    puts error.backtrace
    Controller.new.internal_error
  end

  private

  def control(route_value)
    controller_name, action_name = route_value.split('#')
    klass = Object.const_get "#{controller_name.capitalize}Controller"
    klass.new(name: controller_name, action: action_name.to_sym)
  end
end
