# coding: utf-8
module FunWithStrings
  def palindrome?
    # 去掉大小写和非字符，比较s与s.reverse
    (s = self.downcase.gsub(/\W/, '')) == s.reverse
  end
  def count_words
    # /[[:punct:]]匹配所有的标点符号, split按照空白符进行切割返回集合，each_with_object迭代器，Hash.new(0)产生空的hash
     self.downcase.gsub(/[[:punct:]]/, '').split.each_with_object(Hash.new(0)) { |w, h| h[w] += 1 }
  end
  def anagram_groups
    # 颠倒字母
    Array( self.split.each_with_object(Hash.new{ |h, k| h[k] = [] }) { |w, h| h[w.downcase.chars.sort.join] << w }.values )
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end

