
def my_min1(arr)
  lowest = arr[0]
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      if arr[i] > arr[j] && arr[i] == lowest
        lowest = arr[j]
      end
    end
  end
  lowest
end

def my_min3(arr)
  (0...arr.length).each do |i|
    lowest = true
    (0...arr.length).each do |j|
      if arr[j] < arr[i]
        lowest = false
        break
      end
    end
    return arr[i] if lowest
  end
end


def my_min2(arr)
  arr.inject {|acc, el| acc > el ? el : acc}
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min3(list)  # =>  -5

#phase 1 => O(n^2)
#phase 2 => O(n)


# phase : O(n^3)
def largest_contiguous_subsum1(arr)
  res = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      res << arr[i..j].sum 
    end
  end
  res.max 
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p largest_contiguous_subsum1(list1) # => 8
p largest_contiguous_subsum1(list2) # => 8
p largest_contiguous_subsum1(list3) # => -1


# time : O(n)    space : O(1)
def largest_contiguous_subsum2(arr)
  largest_sum = 0
  current_sum = 0
  (0...arr.length - 1).each do |i|
    if arr[i] + arr[i+1] > largest_sum
      current_sum = arr[i] + arr[i+1] 
      current_sum = 
    end
    largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end