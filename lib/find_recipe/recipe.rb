class FindRecipe::Recipe

  attr_accessor :title, :url, :description, :index

  @@all = []

  def initialize(title, url, description)
    @title = title
    @url = url
    @description = description
    @index = index
    #binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id]
  end

  def site
    @site ||=Nokogiri::HTML(open(self.url))
  end
end
