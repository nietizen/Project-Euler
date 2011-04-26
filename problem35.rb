=begin

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

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

=begin

Eratosthenes Sieve

Removes all nonprimes from an array of arbitrary height.
=end
def sieve(height)
  #initialize with values going from 2 to the arbitrary height.
  primes = Array.new(height) {|i| i}
  primes = primes[2..height]
  #removing is the index in the array
  removing = 0
  #to remove is the current value we are jumping by to remove
  toRemove = primes[removing]
  while (toRemove < Math.sqrt(height))
    #does the removing.  Preserves compactness.
    for i in (removing + toRemove .. primes.length-1).step(toRemove)
      primes[i] = nil
    end
	#finds the next prime to remove by
    toRemove = 0
    while(toRemove == 0 || toRemove == nil)
      removing+=1
      toRemove = primes[removing]
    end
  end
  #removes nil values
  return primes.compact
end

#workhorse for circling around a single number
def swap(x)
  return x[1..x.length] + [x[0]]
end

#checks each prime
def iscircular?(x)
  a = x.to_s()
  b = a.split(//)
  for i in (0 .. b.length-1)
    #not prime, false
    return false if (isprime?((b.join).to_i) == false)
    b = swap(b)
	#if it gets back to the beginning and was all primes, then it will just repeat.
	return true if (a == b.join)
  end
  return true
end

#the height we are checking
primes = sieve(999999)
sum = 0
for i in (0 ... primes.length)
  sum += 1 if (iscircular?(primes[i]))
end
puts primes.length
puts sum