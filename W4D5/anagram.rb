
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


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true


# p permutation("gizmo")    #=> false
# p permutation("abcd").length   #=> true