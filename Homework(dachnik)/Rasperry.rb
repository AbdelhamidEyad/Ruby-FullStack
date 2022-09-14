class Rasperry
   
    @@stages_of_madurity = ["absent", "flowering", "green", "red"]
    
    attr_accessor :index, :stages_of_madurity
  
    def initialize(index)
        @index = index + rand(0..1)
        
    end

    def grow
        if @@stages_of_madurity != "red"
            @index = @index + 1
        else
            puts "This rasperry is ready to harverst"            
        end 
    end

    def madurity_info
        if @@stages_of_madurity[@index] != "red"
           return @@stages_of_madurity[@index]
        else
            return "red"
        end
    end
end

class RasperryBush
    
    
    @@stage_of_growth = ["small", "flowers", "medium", "big"]

    attr_accessor :rasperries, :madurity_of_rasperries, :number_of_rasperries, :index

    def initialize
        @index = rand(0...2)
        @number_of_rasperries = rand(5..25)
        @rasperries = generate_rasperries(@number_of_rasperries)
    end

    def generate_rasperries(num)
        newArray = []
    
        num.times do
            newArray << Rasperry.new(@index)
        end
        newArray
    end

    def generate_rasperries_state
        newArr = []
        @rasperries.each {|rasperry| newArr << rasperry.madurity_info}
        newArr

    end

    def grow
        if @@stage_of_growth != "big"
            @index = @index + 1
            @rasperries.each {|rasperry| rasperry.grow}
        else
            puts "the bush is already in the final stage of growth"
        end
        
    end

    def get_stage_of_growth
        bush_state = @@stage_of_growth[@index]
        rasperries_state = generate_rasperries_state()
        
        "#{bush_state} and the rasperries: #{rasperries_state}"
    end

    def do_harvest
        # We will only harverst the red rasperries
        count_rasperries = 0
        @rasperries.each {|rasperry| 
            if rasperry.madurity_info == "red"
                count_rasperries = count_rasperries + 1
            end
        }
        
        "you have harverst #{count_rasperries} red rasperries"
    end

    
end


class Person
    attr_accessor :name, :plant

    def initialize(name, plant) 
        @name = name
        @plant = plant
    end

    def take_care
       if @plant.get_stage_of_growth != "big"
        @plant.grow
        puts "Your plant has grown! current state: #{@plant.get_stage_of_growth}"
       end
    end

    def harverst
        puts @plant.do_harvest 
    end
end


plant = RasperryBush.new
person = Person.new("joshua", plant)

person.take_care
person.take_care
person.take_care
person.take_care
person.harverst