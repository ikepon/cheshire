class HomeController < Controller
  def index
    @page_title = 'Home Index Page'
    @array = %w[one two three]
  end
end
