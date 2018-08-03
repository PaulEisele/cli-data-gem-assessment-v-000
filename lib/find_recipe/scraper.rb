class FindRecipe::Scraper

  def get_website
    Nokogiri::HTML(open("https://www.delish.com/content/vegetarian-recipes"))
  end

  def scrape_recipes
    self.get_website.css("div.full-item")
  end

  def list_recipes
    scrape_recipes.each do |i|
    #binding.pry
    title = i.css("a.full-item-title").text.strip
    description = i.css("div.full-item-dek p").text.strip
    url = "https://www.delish.com"+i.css("a.full-item-title").attr("href").value
    FindRecipe::Recipe.new(title, url, description)
    end
  end
end
