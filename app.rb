require 'yaml'
ROUTES = YAML.load_file(File.join(File.dirname(__FILE__), 'config', 'routes.yml'))

Dir[File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each { |file| require file }

Dir[File.join(File.dirname(__FILE__), 'config', '**', '*.rb')].each { |file| require file }

require './lib/rudy'

class App < Rudy
end
