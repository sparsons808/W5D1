class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)

  end

  def insert(num)

    raise 'Out of bounds' if !(0...self.store.length).include?(num)
    # if num < 0 || num >= @store.size
    #   raise 'out of bounds'
    # end
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num] == true
  end


  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % self.store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store
  attr_writer :count


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      resize! if @count == @store.size
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % self.store.size]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  # require 'byebug'
  def resize!
    # if self.count == self.store.size
    
    num = self.store.size
  
    num.times do
    
      self.store << []
    end
  
    (0...num).each do |i|
    
      self.store[i].each do |n|
        temp = n
        self.store[i].delete(n)
      
        self[temp] << temp
      end
    
    end
    # end
  end

end
