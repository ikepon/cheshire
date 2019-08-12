class Config
  class Routes < Rudy::Route
    def self.call
      new do |route|
        route.get '/', 'home#index'
        route.get '/tasks', 'tasks#index'
      end
    end
  end
end
