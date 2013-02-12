base34
======
base34 is a simple Ruby module for mixing in methods to convert between base10 and base34 numbers.

Applications of base34 could include, but are not limited to:
- gift/promotion/discount/redemption code generation
- much shorter string representation of long decimal strings, such as a UUID

Specs and Gemification coming soon...

Example Usage:
==============

```ruby
>> class GiftCode
>> include Base34
>> end
=> GiftCode

>> gc = GiftCode.new
=> #<GiftCode:0x100611510>

>> gc.to_base34("393r43")
StandardError: input must be a number
        from ./lib/base34.rb:37:in 'to_base34'
        from (irb):6

>> gc.to_base34(1155)
=> "ZZ"

>> gc.to_base10("ZZ")
=> 1155
```
