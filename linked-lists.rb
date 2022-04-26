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
    if head.nil?
      self.head = Node.new(value)
      return
    end

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
    cur = cur.next_node until cur.next_node.nil? || cur.nil?
    cur
  end

  def at(index)
    cur = head
    cur_ind = 0
    until cur_ind == index || cur.nil?
      cur = cur.next_node
      cur_ind += 1
    end
    cur
  end

  def pop
    return self.head = nil if head.nil? || head.next_node.nil?

    prev = nil
    cur = head
    until cur.next_node.nil?
      prev = cur
      cur = cur.next_node
    end
    prev.next_node = nil
  end

  def contains?(value)
    cur = head
    until cur.nil?
      return true if cur.value == value

      cur = cur.next_node
    end
    false
  end

  def find(value)
    cur = head
    cur_ind = 0
    until cur.nil?
      return cur_ind if cur.value == value

      cur = cur.next_node
      cur_ind += 1
    end
  end

  def to_s
    string = ''
    cur = head
    until cur.nil?
      string += "#{cur.value}->"
      cur = cur.next_node
    end
    "#{string}nil"
  end

  def insert_at(value, index)
    raise 'Invalid index' unless index.between?(0, size)

    node = Node.new(value, at(index))
    return self.head = node if index.zero?

    at(index - 1).next_node = node
  end

  def remove_at(index)
    raise 'Invalid index' unless index.between?(0, size)

    if index.zero?
      self.head = head.next_node if head
      return
    end

    at(index - 1).next_node = at(index).next_node
  end
end
