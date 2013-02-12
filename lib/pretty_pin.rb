#
# PrettyPin is a utility module meant for mixin to add methods for managing the conversion from base10
# to base34 numbers.  The base34 number must be represented as a string.  Useful applications
# include, but are not limited to:
#
# - gift/promotion/discount/redemption code generation
# - much shorter string representation of long decimal strings, such as a UUID

# We use base 34 as this assumes usage of the 10 numeric digits as well as the capitalized alphabet
# without I and O to avoid any confusion with 1 and 0, respectively.
#
module PrettyPin

  BASE34_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                   'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

=begin rdoc
  A static method to turn a base34 string representation into a base10 bignum.
=end
  def to_base10(base34_str)
    raise StandardError.new("input must be a String") unless base34_str.is_a?(String)

    total = 0
    size = base34_str.length
    for i in 0..size-1
      total += BASE34_DIGITS.index(base34_str[i,1]) * 34**(size-(i+1))
    end
    return total
  end

=begin rdoc
  A static method to turn a base10 bignum into a base34 string representation.

  The basic methodology is to decompose work into multiples of 34 - we basically end up creating the base34 number by taking base34 chunks away from the base10 number.
=end
  def to_base34(base10_num)
    raise StandardError.new("input must be a number") unless base10_num.respond_to?(:abs)

    # our storage array...
    base34_arr = Array.new

    # the zero case...
    if base10_num == 0
      base34_arr.push(BASE34_DIGITS[0])
      return base34_arr.to_s
    end

    # get sign...
    sign = base10_num/(base10_num.abs)

    # to ensure non-destructive, lets copy base10_num...
    work = base10_num.abs

    # we build the base34 number from right to left...
    place = 0
    while work > 0 do
      # grab the portion that is representable in our 'place' before we have to increment up to the next 'place'
      remainder =  work % (34**(place+1))
      # build the base34 number from right to left (i.e, tack on at the front)...
      base34_arr.insert(0, BASE34_DIGITS[remainder/(34**place)])
      # remove the portion we just represented...
      work = work - remainder
      # keep going...
      place += 1
    end

    # append a negative sign if negative...
    if sign < 0
      base34_arr.insert(0,'-')
    end

    return base34_arr.to_s
  end

end
