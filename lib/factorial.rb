def factorial(n)
  product = 1
  p "at the start product is #{product}"
  while n > 1
    p "loop starts, n is #{n}"
    p "we multiply #{product} by #{n}"
    product *= n
    p "we get #{product}"
    n -= 1
    p "we subtract 1 from n to get #{n}" 
  end
  p "we finally return #{product}"
  product
end

puts factorial(5)