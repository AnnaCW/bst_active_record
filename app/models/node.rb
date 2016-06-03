class Node < ActiveRecord::Base
  attr_reader :root

  def root
    @root = Node.find(1)
  end

  def insert(new_value, node=root)
    if new_value < node.value
      check_left(new_value, node)
      # new_node = Node.create(value: new_value)
      # update(left_id: new_node.id)
    else
      check_right(new_value, node)
    end
  end

  def check_left(new_value, node)
    if node.left_id.nil?
      new_node = Node.create(value: new_value)
      update(left_id: new_node.id)
    else
      node = Node.find(node.left_id)
      node.insert(new_value, node)
    end
  end

  def check_right(new_value, node)
    if node.right_id.nil?
      new_node = Node.create(value: new_value)
      update(right_id: new_node.id)
    else
      node = Node.find(node.right_id)
      node.insert(new_value, node)
    end
  end

  def left
    if !left_id.nil?
      Node.find(left_id)
    end
  end

  def right
    if !right_id.nil?
      Node.find(right_id)
    end
  end

  def count
    Node.count
  end

  def max
    Node.maximum("value")
  end

  def min
    Node.minimum("value")
  end

end
