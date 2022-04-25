class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end
end
