# encoding=utf-8
# Part 1

# 数组求和
def sum arr
	sum = 0
	arr.each {|x| sum += x}
	return sum
end

# 最大的两个数之和
def max_2_sum arr
	if arr.length() == 0
		return(0)
	elsif arr.length() == 1
		return(arr[0])
	else
		temp = arr.sort { |a, b| b <=> a }
		return(temp[0] + temp[1])
	end
end

# 寻找数组中的两个数使得两个数的和为n
def sum_to_n? arr, n
	(arr.empty? && n.zero?) || arr.permutation(2).any? { |a, b| a + b == n }
end

# Part 2
# 字符串相加
def hello(name)
	"hello," << name
end

# 字符串是否以元音开头
def starts_with_consonant? s
	if s =~ /^[aeiou]/i
		return true
	else
		return false
	end
end

# 字符串是否是二进制串(0,1组合)，且是否是4的倍数
def binary_multiple_of_4? s
	if s =~ /^[01]*1[01]*00$/
		return true
	else
		return false
	end
end

# Part 3
# 构造具有isbn和price属性的BookInStore类，定义price_as_string方法返回价钱字符串
class BookInStock
    # 初始化
	def initialize(isbn, price)
        if isbn =~ /^[0-9][0-9\-]*/ and price > 0
            @isbn, @price = isbn, price
        else
            raise ArgumentError, "Bad data" 
        end
	end

    # getter方法定义
    def isbn
        @isbn
    end

    def price
        @price
    end

    # setter方法定义
    def price=(value)
        @price=value
    end

    def isbn=(value)
        @isbn=value
    end

    def price_as_string
        "$%.2f" % @price
    end
end
