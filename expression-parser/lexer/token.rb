require "dry-struct"
require_relative "./token_type"
require_relative "../types"

class Token < Dry::Struct
  attribute :token_type, Types::Strict::Integer # Types.Instance(TokenType)
  attribute :value, Types::Strict::String
end
