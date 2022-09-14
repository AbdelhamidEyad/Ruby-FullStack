
def pow(value, n)
    result = 1
    n.times do 
        result *= value
    end
    result
end

def calculate_square_root(num)
    upper_bound = num / 2
    lower_bound = 0
  
    while lower_bound <= upper_bound
      midpoint = (upper_bound + lower_bound) / 2
      square = midpoint * midpoint
      if square > num 
        upper_bound = midpoint
      elsif square < num
        lower_bound = midpoint
      else
        return midpoint 
      end
  
      return midpoint if square < num && (midpoint + 1)**2 > num
    end
end
puts calculate_square_root(4)