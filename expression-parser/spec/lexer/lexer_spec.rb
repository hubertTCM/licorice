require_relative "../../lexer/lexer"

describe Lexer do
  shared_examples "single token" do |input, expect_token|
    it "returns operator token" do
      tokens = described_class.new.tokenize(input)
      expect(tokens).to eq([Token.new(token_type: expect_token, value: input)])
    end
  end

  include_examples "single token", "(", TokenType::LEFT_PARENTHESIS
  include_examples "single token", ")", TokenType::RIGHT_PARENTHESIS
  include_examples "single token", "+", TokenType::PLUS
  include_examples "single token", "-", TokenType::MINUS
  include_examples "single token", "*", TokenType::ASTERISK
  include_examples "single token", "/", TokenType::SLASH
  include_examples "single token", "12345", TokenType::NUMBER

  it "expression" do
    tokens = described_class.new.tokenize("(1+2-3)*4")
    expect(tokens).to eq([Token.new(token_type: TokenType::LEFT_PARENTHESIS, value: "("),
                          Token.new(token_type: TokenType::NUMBER, value: "1"),
                          Token.new(token_type: TokenType::PLUS, value: "+"),
                          Token.new(token_type: TokenType::NUMBER, value: "2"),
                          Token.new(token_type: TokenType::MINUS, value: "-"),
                          Token.new(token_type: TokenType::NUMBER, value: "3"),
                          Token.new(token_type: TokenType::RIGHT_PARENTHESIS, value: ")"),
                          Token.new(token_type: TokenType::ASTERISK, value: "*"),
                          Token.new(token_type: TokenType::NUMBER, value: "4")])
  end
end
