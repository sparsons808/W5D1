class HashSet
  attr_reader :count, :store
  attr_writer :count
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key)
      resize! if @count == @store.size
      self[key] << key
      @count += 1
      return true
    end
    false
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    self.store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
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
  end
end
