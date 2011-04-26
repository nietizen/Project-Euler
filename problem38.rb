=begin

Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

=end

#one way of checking for if it contains 1..9 inclusive
def ispan?(x)
  #creates an array of 1..9
  a = Array.new(9) {|i| i + 1}
  for i in (0 .. 8)
    #removes when it finds the number
    a = a - [x[i].to_i]
  end
  #if all were removed, it is true
  return true if (a == [])
  return false
end

#will hold the largest pandigital
max = 0

#cannot be higher than 9999.  10000 + 20000 has 10 digits, anything higher will have at least 10 digits
for i in (0 .. 9999)
  #our n > 1
  numat = 1
  #the string
  concat = i.to_s
  #loop to 9 digits or scrap it
  while (concat.length < 9)
    numat +=  1
    concat += (i * numat).to_s
  end
  if (concat.length == 9)
    max = concat.to_i if (concat.to_i > max && ispan?(concat) == true)
  end
end

puts max