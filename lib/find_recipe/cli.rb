#CLI Controller
class FindRecipe::CLI

  def call
    FindRecipe::Scraper.new.list_recipes
    puts "Welcome to figuring out what to make in the kitchen"
    start
  end

  @input = nil

  def start
    puts ""
    print_recipes
    puts "What recipe would you like more info on?(Type 'exit' to quit)"
    @input =gets.strip
    if @input.downcase == "exit"
      exit
    elsif @input.to_i.between?(1, FindRecipe::Recipe.all.count)
      recipe = FindRecipe::Recipe.find(@input.to_i)
      print(recipe)
      puts ""
      another_recipe
    else
      puts "Input not valid. Please try again"
      start
    end
    if @input == "exit"
      exit
    end
  end
end

  def another_recipe
    puts "Would you like to see another recipe? Enter Y or N"
    @input =gets.strip.downcase
    if @input == "exit"
      exit
    elsif @input == "y"
      start
    elsif @input == "n"
      puts ""
      puts "Have a fun in the kitchen!"
      exit!
    else
      puts ""
      puts "Input not valid"
      exit
    end
  end


  def print_recipes
    puts ""
    puts"List of Recipes: "
    puts ""
    FindRecipe::Recipe.all.each_with_index do|recipe, index|
      puts "#{index}. #{recipe.title}"
    end
  end

  def print(recipe)
    puts ""
    puts "#{recipe.description}"
    puts "#{recipe.url}"
    puts ""
    puts ""
  end
