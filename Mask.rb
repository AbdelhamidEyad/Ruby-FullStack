# write a masker function to tranform all the characters but the last four into #



def maskify(into)
    result  = ""
    len = into.length - 4
    into.each_char.with_index {|value, index| result += index < len ? "#" : value}
    result
end


puts maskify("ach")


# other variant with regex

def maskify2(pwd)
    pwd.gsub(/.(?=.{4})/, '#') # this regex replace all the characters with an # but not the 4 last ones
end 

puts maskify2("dasdsad")
