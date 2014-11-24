class Integer

=begin rdoc
  Turn a base10 integer into a base34 string representation.
  The basic methodology is to decompose work into multiples of 34 - we create the base34 number by taking base34 chunks away from the base10 number.
=end
  def to_base34
    # our storage string...
    base34_str = String.new

    # the zero case...
    if self == 0
      base34_str << UserFriendlyId::BASE34_DIGITS[0]
      return base34_str
    end

    # get sign...
    sign = self/(self.abs)

    # make a working copy of self...
    work = self.abs

    # we build the base34 number from right to left...
    place = 0
    while work > 0 do
      # grab the portion that is representable in our 'place' before we have to increment up to the next 'place'
      remainder =  work % (34**(place+1))
      # build the base34 number from right to left (i.e, tack on at the front)...
      base34_str.insert(0, UserFriendlyId::BASE34_DIGITS[remainder/(34**place)])
      # remove the portion we just represented...
      work = work - remainder
      # keep going...
      place += 1
    end

    # append a negative sign if negative...
    if sign < 0
      base34_str.insert(0,'-')
    end

    return base34_str
  end
end
