require_relative "../utils"
require_relative "./token"

class Lexer
  def initialize
    @extractors = []
    @extractors.push(:extract_number)
    @extractors.push(:extract_operator)
  end

  def tokenize(input)
    current_index = 0
    tokens = []
    while current_index < input.length
      @extractors.each do |extractor|
        temp = method(extractor).call input, current_index
        next if temp.nil?

        current_index = temp[:next_index]
        tokens.push(temp[:token])
        break
      end
    end
    tokens
  end

  private

  def extract_number(input, start_index)
    value = ""
    index = start_index
    while index < input.length && Utils.digit?(input[index])
      value += input[index]
      index += 1
    end
    value.length.positive? ? { next_index: index, token: Token.new(token_type: TokenType::NUMBER, value: value) } : nil
  end

  def extract_operator(input, start_index)
    operators = { "(": TokenType::LEFT_PARENTHESIS,
                  ")": TokenType::RIGHT_PARENTHESIS,
                  "+": TokenType::PLUS,
                  "-": TokenType::MINUS,
                  "*": TokenType::ASTERISK,
                  "/": TokenType::SLASH }
    # puts operators.methods.sort
    # operators.stringify_keys not sure why stringify_keys does not exist

    operators.each do |operator, token_type|
      next unless input[start_index, operator.length] == operator.to_s

      break { next_index: start_index + operator.length,
              token: Token.new(token_type: token_type, value: operator.to_s) }
    end
  end
end
