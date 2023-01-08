class Node

    def initialize(value, left_child=nil, right_child=nil)
        @value = value
        @left_child = left_child
        @right_child = right_child
    end

end

class Tree

    def initialize(arr)
        @root = build_tree(arr)
    end

    def build_tree(arr)
        #need to sort it
        #need to remove duplicates
        
    end

end