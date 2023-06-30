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
    def insertNode(num, node = root)
        reutrn nil if num == node.data

        if num < node.data
            node.left.nil? ? node.left = Node.new(num) : insertNode(num, node.left)
        else
            node.right.nil? ? node.right = Node.new(num) : insertNode(num, node.right)
        end
    end
    
    #Work on this next
    def deleteNode(num, node = root)
        
    end
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
newTree = Tree.new(array1)
newTree.pretty_print
newTree.insertNode(6)
newTree.insertNode(10)
newTree.insertNode(11)
newTree.insertNode(12)
newTree.pretty_print