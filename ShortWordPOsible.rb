
def shoertWordPosible(str)

    results = []
    str.split.each {|word| results << word.length} # we use << instead of .append()
    results.min

end


myWords = "Im a human"
other =  "hello ruby afjosa asfjoaf"
puts shoertWordPosible(myWords)

puts shoertWordPosible(other)