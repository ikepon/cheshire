class TasksController < Rudy::Controller
  def index
    @tasks = %w[one two three]
  end
end
