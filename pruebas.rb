class Amigo

    attr_accessor :hola , :state
    @states = {0 => "hola", 1 => "sajof"}
    
    def initialize(state = 0)
        @hola = %w[a f f f f ]
        @state = @states(0)
    end

end


yo = Amigo.new()
puts yo.state