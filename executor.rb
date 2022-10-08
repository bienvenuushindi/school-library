require_relative 'input_reader'

class Executor
  def initialize(app)
    @app = app
  end

  def launch
    @app.starter
  end
end
