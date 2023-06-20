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

    #This method is taken from TOP
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    def insertNode(num, node = @root)
        
        return nil if node == nil
        
        insertNode(num, node.right) if num > node.data
        insertNode(num, node.left) if num < node.data

        #For example node with data 10
        #it needs to be inserted as Node 9's right child and node 23's left child
        #Node 10 needs to append node 23 as right child

        if num < node.data
            newNode = Node.new(num)
            node.left = newNode
        elsif num > node.data
            newNode = Node.new(num)
            node.right = newNode
            
        end
    end
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
newTree = Tree.new(array1)
newTree.pretty_print
newTree.insertNode(10)
newTree.pretty_print