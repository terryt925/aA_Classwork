# time:O(n!)
def first_anagram?(str1, str2)
  res = permutation(str1)
  res.include?(str2)
end

def permutation(str)
  return [str] if str.length <= 1
  res = []
  last = permutation(str[0...-1])
  last.each do |s|
    (0..s.length).each do |index|
      res << s[0...index] + str[-1] + s[index..-1]
    end
  end
  res
end


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


# p permutation("gizmo")    #=> false
# p permutation("abcd").length   #=> true


# phase 2   O(n^3)
def second_anagram?(str_1,str_2)
  str_1.each_char do |c|
    index = str_2.split("").find_index(c)
    str_2 = str_2[0...index] + str_2[index + 1..-1] unless index.nil?
  end
  str_2.empty?
end


# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


#phase 3    O(n^3)

def third_anagram?(str_1,str_2)
  str_1.split("").sort == str_2.split("").sort
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

#phase 4   O(n) 
def fourth_anagram?(str_1, str_2)
  return false if str_1.length != str_2.length 
  hash = Hash.new(0)
  str_1.each_char {|char| hash[char] += 1}
  str_2.each_char {|char| hash[char] -= 1}
  hash.all? {|k, v| v == 0}
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true