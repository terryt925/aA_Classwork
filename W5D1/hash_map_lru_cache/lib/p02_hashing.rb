class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    
  end
end

class String
  def hash
    integer_string = ''
    self.each_char.with_index do |char,i|
      integer_string += i.to_s + char
    end
    integer_string.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
