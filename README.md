[![Build Status](https://travis-ci.org/alexagranov/user_friendly_id.svg?branch=master)](https://travis-ci.org/alexagranov/user_friendly_id)
[![Gem Version](https://badge.fury.io/rb/user_friendly_id.svg)](https://badge.fury.io/rb/user_friendly_id)

user_friendly_id
======
Add methods to Integer and String to convert between base10 and base34 representations of a number.  

Base34 rocks!!!
- shorter than decimal
- shorter than hexadecimal 
- case insensitive when compared with base64
- avoids user input confusion associated with 1/I and 0/O

Base34 is represented with the following characters: [0-9] and [A-Z, minus I & O to avoid any readability issues]

Applications of user_friendly_id could include, but are not limited to:
- gift/promotion/discount/redemption code generation
- much shorter string representation of long decimal strings, such as a UUID or MongoDB object id

Example Usage:
==============

```ruby
>> 33.to_base34
=> "Z"

>> 34.to_base34
=> "10"

>> "10".to_base10
=> 34

>> 1155.to_base34
=> "ZZ"

>> "ZZ".from_base34
=> 1155

>> "0000000000ZZ".from_base34
=> 1155

>> "   00ZZ  ".from_base34
=> 1155

# you can represent 10^24 - one septillion - with just 16 base34 digits, aka, a string of length 16
>> (10 ** 24).to_base34
=> "ANGMLFL5UA0AW72G"

# typical MongoDB ObjectId
>> "507f191e810c19729de860ea".hex.to_base34
=> "6RRUV0LLDJG0N6MAYBL" 

# typical UUID
>> "6948DF80-14BD-4E04-8842-7668D9C001F5".gsub(/-/,'').hex.to_base34
=> "QKH6RDPUM5ACPE8GWKWB2PSMB" 

```
