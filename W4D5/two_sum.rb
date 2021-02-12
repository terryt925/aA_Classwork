
# brute force O(n^2)
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# sorting O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr.sort! # O(n)
  arr.each.with_index do |ele,i| 
    target = target_sum - ele  
    res = b_search(arr[0...i] + arr[i+1..-1], target) # exclude the current ele
    return true unless res.nil?
  end
  false 
end

def b_search(arr, target)
  return nil if arr.empty?

  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid+1..-1]
  return mid if arr[mid] == target 
  if target < arr[mid]
    b_search(left, target)
  else
    res = b_search(right, target)
    return res + mid + 1 unless res.nil?
  end
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false





