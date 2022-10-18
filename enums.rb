require 'byebug'

class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.my_each() do |ele|
      if prc.call(ele) == true
        arr << ele
      end
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    self.my_each() do |ele|
      unless prc.call(ele) == false
        arr << ele
      end
    end
    arr
  end

  def my_any(&prc)
    self.my_each do |ele|
      if prc.call(ele) == true
        return true
      end
    end
    return false
  end

  def my_flatten
    output = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        output.concat(ele.my_flatten)
      else
        output << ele
      end
    end
    output
  end

  def my_zip(*args)
    #for each element in self, create a subarray where self[i] is the first element
    output = Array.new(self.length){Array.new()}
    i = 0
    self.my_each do |ele1|
      output[i] << ele1
      args.my_each do |arg|
        if arg[i] == nil
          output[i] << nil
        else
          output[i] << arg[i]
        end
      end
      i += 1
    end
    output
  end

  def my_rotate(n)

    if n > 0
      n.times do
        self.push(self.shift)
      end
    else
      x = n * -1
      x.times do
        self.unshift(self.pop)
      end
    end
  end

  def my_join(delimiter="")
    output = ""
    self.my_each do |ele|
      output << ele.to_s + delimiter
    end
    output
  end

  def my_reverse
    output = []
    self.each do |ele|
      output.unshift(ele)
    end
    output
  end

end
