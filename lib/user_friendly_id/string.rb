class String

=begin rdoc
  Turn a base34 string representation into a base10 integer.
=end
  def from_base34
    raise ArgumentError.new("Invalid characters for a base34 number found") unless self.valid_base34?
    kleen = self.kleened
    total = 0
    size = kleen.length
    for i in 0..size-1
      total += UserFriendlyId::BASE34_DIGITS.index(kleen[i,1]) * 34**(size-(i+1))
    end
    total *= -1 if is_negative?
    return total
  end

  def valid_base34?
    # only the alpha minus I & O is what we want...
    not /[^0-9a-zA-Z&&[^ioIO]]/.match(self.kleened)
  end

  def is_negative?
    self.chr == '-'
  end

  protected

  def kleened
    # get rid of leading/trailing whitespace...
    kleen = self.strip
    # strip any leading negative sign...
    kleen = kleen[1..-1] if is_negative?
    kleen
  end
end
