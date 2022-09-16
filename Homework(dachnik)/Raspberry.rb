class Raspberry
   
    @@stages_of_madurity = ["absent", "flowering", "green", "red"]
    
    attr_accessor :index, :stages_of_madurity
  
    def initialize
        @index = rand(0..1)
        
    end

    def grow
        if @index < (@@stages_of_madurity.length - 1)
            @index = @index + 1
        else
            puts "This raspberry is ready to harverst"            
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

class RaspberryBush
    
    
    @@stage_of_growth = ["small", "flowers", "medium", "big"]

    attr_accessor :raspberriess, :number_of_raspberries, :index

    def initialize
        @index = rand(0...2)
        @number_of_raspberries = rand(5..25)
        @raspberries = generate_raspberries(@number_of_raspberries)
    end

    def generate_raspberries(num)
        newArray = []
        num.times do
            newArray << Raspberry.new
        end
        newArray
    end

    def generate_raspberries_state
        newArr = []
        @raspberries.each {|raspberry| newArr << raspberry.madurity_info}
        newArr
    end

    def grow
        if @index < (@@stage_of_growth.length - 1)
            @index = @index + 1
            @raspberries.each {|raspberry| raspberry.grow}
        else
            puts "the bush is already in the final stage of growth"
        end
        
    end

    def get_stage_of_growth
        bush_state = @@stage_of_growth[@index]
        raspberries_state = generate_raspberries_state()
        
        "#{bush_state} and the raspberries: #{raspberries_state}"
    end

    def get_bush_state
        @@stage_of_growth[@index]
    end



    def do_harvest
        # We will only harverst the red raspberries
        count_raspberries = 0
        message = ""
        @raspberries.each {|raspberry| 
            if raspberry.madurity_info == "red"
                count_raspberries = count_raspberries + 1
            end
        }
        
        if(@count_raspberries == @number_of_raspberries)
            message = "You have harvest all the raspberries you Won!" 
        else
            message = "you have harverst #{count_raspberries} red raspberries of #{number_of_raspberries} raspberries, keep trying"
        end
        message
    end

    def toString
        
        "Rasperry Bush, number of raspberries in it: #{@number_of_raspberries}\n
        State of bush: #{@@stage_of_growth[@index]}\n
        State of raspberries: #{@generate_raspberries_state}"
    end 
    
end


class Person
    attr_accessor :name, :plant

    def initialize(name, plant) 
        @name = name
        @plant = plant
        # the number of raspberries that the plant has (randomly generated)
        @raspberries_count = @plant.number_of_raspberries 
    end


    def take_care
       if @plant.get_bush_state != "big"
        @plant.grow
        puts "Your plant has grown! current state: #{@plant.get_stage_of_growth}"
       end
       @plant.grow
       puts "current state: #{@plant.get_stage_of_growth}"
    end

    def harverst
        puts @plant.do_harvest 
    end
end




puts "Wellcome whats your name ?"
name = gets.chomp
plant = RaspberryBush.new
puts "hello #{name}, you have a Raspberry bush to take care of"
puts "'Here is it!"
puts plant.toString
puts "you can take care of it to make it grow!, then you can harvest the raspberries"

while(answear != "exit")
    answear = gets.chomp
    
end


