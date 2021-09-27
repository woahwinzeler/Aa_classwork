require_relative "p01_int_set"

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    super(key.hash)
  end

  def include?(key)
    super(key.hash)
  end

  def remove(key)
    @count = super(key.hash) if !@count.nil?
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    super
  end
end
