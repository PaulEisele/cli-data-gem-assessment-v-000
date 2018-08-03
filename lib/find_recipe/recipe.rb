class FindRecipe::Recipe

  attr_accessor :title, :url, :description, :index

  @@all = []

  def initialize(title, url, description)
    @title = title
    @url = url
    @description = description
    @index = index
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id]
  end

  def title
    @title ||= i.css("a.full-item-title").text.strip
  end

  def url
    @url ||= "https://www.delish.com"+i.css("a.full-item-title").attr("href").value
  end

  def description
    puts "hello"
    @description ||= i.css("div.full-item-dek p").text.strip
  end

  def site
    @site ||=Nokogiri::HTML(open(self.url))
  end
end
