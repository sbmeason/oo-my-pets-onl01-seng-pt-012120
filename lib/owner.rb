class Owner
  @@all= []
  attr_reader :species, :name

  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 
  
  def buy_cat(name)
    cats << Cat.new(name, self)   
  end 
  
  def buy_dog(name)
    dogs << Dog.new(name, self)   
  end 

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end 
  end
  
  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end 
  end

  def sell_pets
   my_pets = self.cats + self.dogs
   my_pets.each do |pets|
     pets.mood = "nervous"
     pets.owner = nil
   end
 end

  def list_pets
    num_dogs = dogs.size
    num_cats = cats.size
    return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end


  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end
end