class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.map(&:to_s).join("").to_i
  end
end

class String
  def hash
    alphabet = ("A".."z").to_a
    new_str = []
    self.each_char {|char| new_str << alphabet.index(char)}
    new_str.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_arr = []
    self.keys.each {|k| new_arr << k.object_id}
    new_arr.sum
  end
end
