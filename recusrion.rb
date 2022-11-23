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
    return 0 if n == 1
    return 1 if n == 2
    prev_fib = rec_fibonacci(n - 1)
    prev_fib = prev_fib[-2] + prev_fib[-1]
end

def iter_fibonacci(n)
end

p rec_fibonacci(3)