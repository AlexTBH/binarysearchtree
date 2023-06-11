require 'set'

class Node
    attr_accessor :data, :left, :right

    def initialize(value, left=nil, right=nil)
        @data = value
        @left = nil
        @right = nil
    end

end

class Tree
    attr_accessor :root

    def initialize(arr)
        self.root = build_tree(cleanArray(arr))
    end

    def build_tree(arr)

        #end of recursion
        unless arr.length > 1
            return arr    
        end

        root = Node.new((arr.length+1)/2)
        
        #recursive function, split the array in half and send it to build_tree function
        root.left = build_tree(arr.slice(0, (arr.length+1)/2))
        root.right = build_tree(arr.slice((arr.length+1)/2, arr.length+1))
        
        
        #creating nodes and assingning left/right nodes
        puts root.data
        pretty_print
    end

    def cleanArray(arr)
        new_arr = arr.sort
        new_set = new_arr.to_set
        arr = new_set.to_a
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
end


array1 = [1, 2, 3, 4 ,5]
newTree = Tree.new(array1)



# 1, 2, 3, 4, 5, 8, 9, 10, 11, 12