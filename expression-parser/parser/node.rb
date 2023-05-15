class NodeType
  def self.add_item(key, value)
    @hash ||= {}
    @hash[key] = value
  end

  def self.const_missing(key)
    @hash[key]
  end

  NodeType.add_item :BINARY_OPERATOR, 1 # + - * /
  NodeType.add_item :NUMBER, 2
end

class BinaryNode
  attr_accessor :operator_type, :left_operand, :right_operand
end
