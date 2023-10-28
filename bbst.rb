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

    def insertNode(value, node = root)
        reutrn nil if value == node.data

        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insertNode(value, node.left)
        else
            node.right.nil? ? node.right = Node.new(value) : insertNode(value, node.right)
        end
    end
    

    def deleteNode(value, node = root)
        
        return nil if node.nil?

        if value < node.data
            node.left = deleteNode(value, node.left)
        elsif value > node.data
            node.right = deleteNode(value, node.right)
        else
            return node.left if node.right.nil?
            return node.right if node.left.nil?        

            temp = node.right
            while temp.left != nil
                temp = temp.left
            end

            node.data = temp.data
            temp.data = value
            deleteNode(value, node.right) 
        end
        node
    end

    def findNode(value, node = root)

        return nil if node.nil?

        if value < node.data
            findNode(value, node.left)
        elsif value > node.data
            findNode(value, node.right)
        else
            return node.data  
        end 
    end

    def levelOrder
        node = root
        nodeStack = [node]
        nodeValues = []        
        
        while node.left != nil? && node.right != nil?

            nodeStack.push(node.right) unless node.right.nil?
            nodeStack.push(node.left) unless node.left.nil?

            block_given? ? yield(node) : nodeValues.push(nodeStack[0].data)
            
            nodeStack.shift
            break if nodeStack.empty?
            node = nodeStack[0]
        end
        nodeValues unless block_given?
    end

    def inorder(node = root, result = [], &block)

        unless node.nil?        
            inorder(node.left, result, &block) if node.left != nil?
            block_given? ? yield(node.data) : result << node.data
            inorder(node.right, result, &block) if node.right != nil?
        end

        block_given? ? yield(result) : result
    end

    def preorder(node = root, result = [], &block)
        
        unless node.nil?
            block_given? ? yield(node.data) : result << node.data
            preorder(node.left, result, &block)
            preorder(node.right, result, &block)
        end
        block_given ? yield(result) : result
    end

    def postorder(node = root, result = [], &block)

        unless node.nil?
            postorder(node.left, result, &block)
            postorder(node.right, result, &block)
            block_given? ? yield(node.data) : result << node.data
        end
        block_given? ? yield(result) : result

    end
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
newTree = Tree.new(array1)

newTree.insertNode(6)
newTree.insertNode(10)
newTree.insertNode(11)
newTree.insertNode(12)
newTree.insertNode(22)
newTree.insertNode(201)
newTree.insertNode(200)
newTree.insertNode(199)
newTree.insertNode(250)
newTree.insertNode(17)
newTree.pretty_print    
newTree.deleteNode(67)
newTree.insertNode(18)
newTree.insertNode(2)
newTree.pretty_print
newTree.findNode(199)
newTree.levelOrder
newTree.inorder
newTree.preorder
newTree.postorder   


