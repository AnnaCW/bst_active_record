require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  require 'test_helper'

    test "it inserts root" do
      root = Node.create(value: 10)

      assert_equal Node, root.class
      assert_equal 10, root.value
    end

      test "root starts with no child nodes" do
        root = Node.create(value: 10)

        assert_equal nil, root.left
      end

      test "it inserts second node and finds root-left" do
        root = Node.create(value: 10)
        root.insert(5)

        assert_equal 5, root.left.value
      end

      test "it inserts third node and finds root-left" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)

        assert_equal 5, root.left.value
        assert_equal 2, root.left.left.value
      end

      test "it inserts four nodes and finds root-right" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)
        root.insert(6)

        assert_equal 6, root.left.right.value
      end

      test "it finds node count" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)
        root.insert(6)

        assert_equal 4, root.count

      end

      test "it finds node max" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)
        root.insert(6)

        assert_equal 10, root.max

      end

      test "it finds node min" do
        root = Node.create(value: 10)
        root.insert(5)
        root.insert(2)
        root.insert(6)

        assert_equal 2, root.min

      end




end
