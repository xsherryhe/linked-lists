class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    cur = head
    cur = cur.next_node until cur.next_node.nil?
    cur.next_node = Node.new(value)
  end

  def prepend(value)
    self.head = Node.new(value, head)
  end

  def size
    cur = head
    count = 0
    until cur.nil?
      count += 1
      cur = cur.next_node
    end
    count
  end

  def tail
    cur = head
    cur = cur.next_node until cur.next_node.nil?
    cur
  end
end

node1 = Node.new(3)
list = LinkedList.new(node1)
p list.head
p list.size
list.prepend(5)
list.prepend(6)
p list.head
p list.size
p list.tail
