class MediumScraper
  attr_accessor :agent, :posts

  def initialize
    @agent = Mechanize.new
    @home_page = "https://medium.com/@jgisin/latest"
    @index = @agent.get(@home_page)
    @posts = get_posts
    @post = {}
  end

  def get_posts
    @index.search('article.postArticle')
  end

  def num_posts
    @posts.length
  end

  def post_link(index)
    @posts[index].children[0].attributes['href'].value
  end

  def post_text(index)
    @posts[index].search('div.section-inner').children[1].children[0]
  end

  def post_title(index)
    @posts[index].search('div.section-inner').children[0].children[0]
  end

  def post(index)
    @post = {link: post_link(index), text: post_text(index), title: post_title(index)}
  end
end

# t = MediumScraper.new
# binding.pry
# t.get_posts
