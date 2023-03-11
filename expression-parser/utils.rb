module Utils
  extend self

  def digit?(input)
    code = input.ord
    # 48 is ASCII code of 0
    # 57 is ASCII code of 9
    code >= 48 && code <= 57
  end
end
