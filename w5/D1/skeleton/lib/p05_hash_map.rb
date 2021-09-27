require_relative 'p04_linked_list'
require "byebug"

class HashMap
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hashed_key = key.hash
    @store[bucket(key)].include?(hashed_key)
  end

  def set(key, val)
    
  end

  def get(key)
    # debugger
    hashed_key = key.hash
    nodes = []
    # return key if @store[bucket(key)].include?(hashed_key)
    @store[bucket(key)].each do |node|
      nodes << node
    end
    nodes
    # nil
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_int_set = ResizingIntSet.new(num_buckets * 2)
    @count = 0
    @store.each do |bucket|
      bucket.each do |ele|
        new_int_set.store[ele % (num_buckets * 2)] << ele
        @count += 1
      end
    end
    @store = new_int_set.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    hashed_key = key.hash
    hashed_key % num_buckets
  end
end
