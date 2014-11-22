pretty_id
======
pretty_id is a simple Ruby module for mixing in methods to convert between base10 and base34 numbers.

Base34 is represented with the following characters: [0-9] and [A-Z, minus I & O to avoid any readability issues]

Applications of pretty_id could include, but are not limited to:
- gift/promotion/discount/redemption code generation
- much shorter string representation of long decimal strings, such as a UUID

Example Usage:
==============

```ruby
>> class GiftCode < Integer
>> end
=> GiftCode

>> gc = 33
=> 33

>> gc.to_base34
=> "Z"

>> "Z".to_base10
=> 33

>> 34.to_base34
=> "10"

>> "10".to_base10
=> 34

>> 1155.to_base34
=> "ZZ"

>> "ZZ".to_base10
=> 1155

>> "0000000000ZZ".to_base10
=> 1155

# you can represent 10^24 - one septillion - with just 16 base34 digits, aka, a string of length 16
>> (10 ** 24).to_base34
=> "ANGMLFL5UA0AW72G"
```
