#Warm up

def range (start_num, end_num)
    return [] if start_num > end_num

    [start_num] + range(start_num+1,end_num)
end

# p range(1,5)
# p range(5,3)
# p range(2,10)

# iterative 
# def sum_of_array(arr)
#     sum = 0
#     arr.each do |num|
#         sum += num
#     end
#     return sum
# end

# recursive

def sum_of_array(arr)
    return 0 if arr.empty?

    arr[0] + sum_of_array(arr[1..-1])
end

# p sum_of_array([1,2,3,4,5,6])
# p sum_of_array([])

def exp(base, num) #num = 256, its gonna take 256 recursive steps 
    return 1 if num == 0

    base * exp(base, num - 1)
end

# p exp(2, 3)
# p exp(2, 5)
# p exp(2, 0)

def exp(base, num) # num 
    return 1 if num == 0
    return base if num == 1

    if num.even?
        exp(base, num/2)**2
    else
        base * (exp(base, (num - 1)/ 2)**2)
    end
end

# p exp(2, 3)
# p exp(2, 5)
# p exp(2, 0)
class Array
    def deep_dup
        arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                arr << ele.deep_dup
            else
                arr << ele
            end
        end
        arr
    end 
end

# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def rec_fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2

    rec_fibonacci(n-1) << rec_fibonacci(n-1)[-2] + rec_fibonacci(n-1)[-1]
end

def iter_fibonacci(n)
    return [] if n == 0
    return [0] if n == 1

    arr = [0,1]

    while arr.length < n
        arr << arr[-2] + arr[-1]
    end
    return arr
end

# p rec_fibonacci(7)
# p iter_fibonacci(7)

def bsearch(array, target)
    return nil if array.length == 0
    mid = array.length/2
    left_arr = array[0...mid]
    right_arr = array[mid+1..-1]

    if mid == target
        return mid
    elsif target < mid
        bsearch(left_arr,target)
    else
        res = bsearch(right_arr,target)
        return res == nil ? nil : res + mid + 1
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil