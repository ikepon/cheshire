class Rudy
  attr_reader :router

  def self.root
    File.expand_path('..', File.dirname(__FILE__))
  end

  def initialize
    routes = Config::Routes.call.routes
    @router = Router.new(routes)
  end

  def call(env)
    result = router.resolve(env)
    [result.status, result.headers, result.content]
  end
end
