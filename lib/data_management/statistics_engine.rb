#This class is responsible for generating Rubyrt's statistical results
#Only maximum , minimum , average and standard deviation are supported in the time being
class StatisticsEngine
  #This Engine waits for a one dimensional array.
  def self.get_sum (my_array)
    my_array.inject(0){|sum,item| sum + item}        
  end
 
  def self.avg (my_array)
    get_sum(my_array)/my_array.size
  end

  def self.max (my_array)
    my_array.max
  end
 
  def self.min (my_array)
    my_array.min
  end

  def self.stdv (ary)
    mean=self.avg(ary)
    Math.sqrt( (ary.inject(0) { |dev, i| 
                dev += (i - mean) ** 2}/ary.length.to_f) )
  end 
end# end of StatisticsEngine class