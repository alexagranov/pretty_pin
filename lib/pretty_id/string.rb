class String

=begin rdoc
  Turn a base34 string representation into a base10 integer.
=end
  def to_base10
    total = 0
    size = self.length
    for i in 0..size-1
      total += BASE34_DIGITS.index(self[i,1]) * 34**(size-(i+1))
    end
    return total
  end
end
