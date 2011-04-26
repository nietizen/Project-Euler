=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

=end

#prime check
def isprime?(x)
  return false if (x <= 1)
  a = Math.sqrt(x)
  #up to sqrt(x), check if any divide into x
  for i in (2 .. a)
    return false if (x%i == 0)
  end
  return true
end

#doing this with recursively putting permutations into an array
def perms(array,number)
  #only one possible choice
  if (array.length == 1)
    return [number + array[0].to_s]
  end
  #create the remaining possible choices
  a = []
  for i in (0 .. array.length-1)
    a = a + perms(array-[array[i]],array[i].to_s + number)
  end
  #return this array
  return a
end

=begin
quick reduction.
n!=9 or 8.  1+2..+9 is 45.  Up to 8 is 36.
Both sum of digits are divisible by 3, so any pandigital number of those numbers are divisible by 3.
Assumed 7-digit pan prime existed.  If none, easy to go to 6.
=end

#gets the permutations
n = Array.new(7) {|i| i+1}
perm = perms(n,"")
puts perm.length

max = 0

#checks the permutations
for i in (0 .. perm.length-1)
temp = perm[i].to_i

if (temp > max)
max = temp if (isprime?(temp))
end

end

puts max