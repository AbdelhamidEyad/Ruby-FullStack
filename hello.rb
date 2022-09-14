class Song

    def initialize(name, duration, artist)
        @name = name
        @artist = artist
        @duration = duration
    end

    def getName
        @name
    end 
end 

# We can acces to a variable throught getters 


song1 = Song.new("legends never die", 100, "wow")

puts song1.getName


# LOOK this example

str = "hello, %s" 

puts str % "100"

