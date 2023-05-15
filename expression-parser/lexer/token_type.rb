# use enum in ruby. https://www.rubyfleebie.com/2007/04/17/enumerations-and-ruby/
class TokenType
  def self.add_item(key, value)
    @hash ||= {}
    @hash[key] = value
  end

  def self.const_missing(key)
    @hash[key]
  end

  def self.each(&block)
    @hash.each(&block)
  end
  TokenType.add_item :LEFT_PARENTHESIS, 1  # (
  TokenType.add_item :RIGHT_PARENTHESIS, 2 # )
  TokenType.add_item :PLUS, 3 # +
  TokenType.add_item :MINUS, 4 # -
  TokenType.add_item :ASTERISK, 5 # *
  TokenType.add_item :SLASH, 6 # /
  TokenType.add_item :NUMBER, 7
end
# #That's it! We can now use our enum :
# my_color = TokenType::RED if some_condition
# #And we can loop
# TokenType.each do |key,value|
#   do_something_with_value(value)
# end
