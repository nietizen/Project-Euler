=begin

Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.

=end

#bouncy check
def isbouncy?(x)
  #has to be at least size 3.
  a = (x.to_s).split(//)
  return false if (a.length <= 2)
  
  #each portion of array to integer
  for i in (0 .. a.length-1)
    a[i] = a[i].to_i
  end

  #kind of inefficient.  Checks fluctuations in value
  temp = a[0] <= a[a.length-1]
  for i in (0 .. a.length-2)
    return true if (a[i] >= a[i+1] == temp && a[i] != a[i+1])
  end

  return false
end

#first bouncy number
total = 101.0
bouncy = 1
i = 102
#iterate until it is exactly 99%
while (bouncy/total != 0.99)
  total += 1.0
  bouncy += 1.0 if (isbouncy?(i) == true)
  i+=1
end

puts bouncy
puts total
puts bouncy/total


puts isbouncy?(1122)
puts isbouncy?(2211)
