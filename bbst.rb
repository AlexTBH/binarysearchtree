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
    
    #Work on this next
    def deleteNode(value, node = root, parentNode = nil, is_left = true)
        #Recursive function until the node.data match the value input.
        #Use "is_left = true" to figure out if the child node is right or left of the rootnode.
        #Reach the value of the to be deleted node, then use temp variable for the parent node to delete the chidl node
        
        return nil if node == nil

        if value < node.data
            node.left.nil? ? return : deleteNode(value, node.left, node, true)
        elsif value > node.data
            node.right.nil? ? return : deleteNode(value, node.right, node, false)
        else
            is_left ? parentNode.left = nil : parentNode.right = nil
        end
    end
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
newTree = Tree.new(array1)

newTree.insertNode(6)
newTree.insertNode(10)
newTree.insertNode(11)
newTree.insertNode(12)
newTree.insertNode(22)

newTree.deleteNode(3)
newTree.pretty_print
