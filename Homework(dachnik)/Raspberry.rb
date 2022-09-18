class Raspberry
   
    @@stages_of_madurity = %w[absent flowering green red]  
    attr_accessor :index, :stages_of_madurity
  
    def initialize
        @index = rand(0..1)  
    end

    def grow
        if @index < (@@stages_of_madurity.length - 1)
            @index += 1
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
     
    @@stage_of_growth = %w[small flowers medium big]
    attr_accessor :raspberriess, :number_of_raspberries, :index

    def initialize(number_of_raspberries)
        @index = rand(0...2)
        @number_of_raspberries = number_of_raspberries > 100 ? 100 : number_of_raspberries
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
        @raspberries.each {|raspberry| newArr << ("& " + raspberry.madurity_info)}
        newArr
    end

    def grow
        if @index < (@@stage_of_growth.length - 1)
            @index += 1
            @raspberries.each {|raspberry| raspberry.grow}
        else
            @raspberries.each {|raspberry| raspberry.grow}
            puts "The bush is already in the final stage of growth"
        end     
    end

    def get_stage_of_growth
        bush_state = @@stage_of_growth[@index]
        bush_state
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
        if(count_raspberries < @number_of_raspberries)
            message = "have harverst #{count_raspberries} red raspberries of #{number_of_raspberries} raspberries, keep trying"
        else
            message = "have harvest all the raspberries, he won!!" 
        end
        message
    end

    def to_s
        "Rasperry Bush: number of raspberries in it: #{@number_of_raspberries}\nState of bush: #{@@stage_of_growth[@index]}"
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
        return "#{@name}'s plant has grown! current state: #{@plant.get_stage_of_growth}"
       end
       @plant.grow
       return "current state: #{@plant.get_stage_of_growth}"
    end

    def harverst
        @name +  " " + @plant.do_harvest 
    end
end

puts "Wellcome whats your name ?"
name = gets.chomp
puts "hello #{name}, you have a Raspberry bush to take care of"
puts "Select number of Raspberries you want:"
num_raspberries = gets.chomp.to_i
plant = RaspberryBush.new(num_raspberries)
player = Person.new(name, plant)
puts "Here is it...."
sleep 2
puts plant
sleep 2 
puts "you can take care of it to make it grow!, and you can harvest the raspberries"
sleep 2
puts "but make sure that they are red"

loop do
    puts "--------------------------"
    puts "insert an option:"
    puts "1: make the plant grow!\n2: look the state of growth\n3: harvest\n4: exit"
    puts "--------------------------"
    answear = gets.chomp

    case answear 
    when "1"
        puts player.take_care
        sleep 2
    when "2"
        puts "\n"
        puts "State of #{player.name}'s raspberries ))"
        puts player.plant.generate_raspberries_state
        puts "\n"
        sleep 2
    when "3"
        puts player.harverst
        sleep 2
    end

    if answear == "4" or answear == "exit"
        break
    end 
end