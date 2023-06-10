require 'set'

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
        new_arr = arr.sort
        new_set = new_arr.to_set
        
        #need to sort it, sort
        #need to remove duplicates, save all the elements in a set, convert the set to an array later
        

        return @root
    end

end