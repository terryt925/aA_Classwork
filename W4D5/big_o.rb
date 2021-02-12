
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

def largest_contiguous_subsum(arr)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      temp = arr[i..j]
    end
  end
end