# example file
# run with almost-rackup

class UpcaseMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    upcased = []
    status, headers, body = @app.call(env)
    body.each { |str| upcased << str.upcase }
    [status, headers, upcased]
  end
end

use UpcaseMiddleware
run proc { |e| [200, {'Content-Type' => 'text/plain'}, ['Hello World']] }
