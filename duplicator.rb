# Convert String into othe String if the letter apears more than ones it will be ")" nad other case will be "("


def encoder(initial)
    result = ""
    initial.each_chars do |values|
        puts values
    end
    result
end

word = "din"
puts encoder(word)



# answear study


def duplicate_encode(word)
    word
        .downcase
        .chars
        .map{|char| word.downcase.count(char) > 1 ? letter = "("} 
        .join
end 






