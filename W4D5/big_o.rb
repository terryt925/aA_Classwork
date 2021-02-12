
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




def my_min2(arr)
  arr.inject {|acc, el| acc > el ? el : acc}
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min1(list)  # =>  -5
