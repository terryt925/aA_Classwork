

# time : O(n^2)
def windowed_max_range(arr, window_size)
  max_range = nil 
  (0..arr.length - window_size).each do |i|
    current_range = arr[i...i+window_size].max - arr[i...i+window_size].min 
    max_range = current_range if max_range.nil? || current_range > max_range 
  end
  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8