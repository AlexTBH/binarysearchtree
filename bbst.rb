require 'set'

class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root

    def initialize(arr)
        @root = build_tree(cleanArray(arr))
    end

    def build_tree(arr)
        return nil if arr.empty?        

        half = (arr.size-1) / 2
        root = Node.new(arr[half])
        
        root.left = build_tree(arr[0...half])
        root.right = build_tree(arr[(half +1)..-1])       
        
        return root
    end

    def cleanArray(arr)
        new_arr = arr.sort
        new_set = new_arr.to_set
        arr = new_set.to_a
    end

    #This method is taken from TOP to visualise the tree while working on it
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    #Had to take at RoPalma 95 @ GitHub for solution since I couldn't figure out this one 
    def insertNode(value, node = root)
        reutrn nil if value == node.data

        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insertNode(value, node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insertNode(value, node.right)
        end
    end
    

    def deleteNode(value, node = root)
        
        return nil if node == nil

        if value < node.data
            node.left = deleteNode(value, node.left)
        elsif value > node.data
            node.right = deleteNode(value, node.right)
        else
            return node.left if node.right.nil?
            return node.right if node.left.nil?        

            #continue to work here for 2 child nodes
            temp = nil

        end
        node
    end
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
newTree = Tree.new(array1)

newTree.insertNode(6)
newTree.insertNode(10)
newTree.insertNode(11)
newTree.insertNode(12)
newTree.insertNode(22)
newTree.pretty_print
newTree.deleteNode(7)
newTree.deleteNode(3)
newTree.insertNode(17)
newTree.insertNode(18)
newTree.pretty_print
