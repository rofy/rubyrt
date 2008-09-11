class GroupingEngine
#The grouping Engine works on a table, which means that its input is a two dimensional Array  
#-------------------------------------------------------------------------------
  def initialize ungrouped_array
    @grouped_array = []
    @input_array = ungrouped_array
    @limits = [0,@input_array.length]
    @temp_grouped_array =[]
  end
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
  def group index
    @input_array.each do |current_row|  
      found_flag = find_element current_row[index]
      
      if found_flag != -1
        new_row = []
        new_row << ""
        current_row.each_with_index do |obj,i|  
          new_row << obj unless (i ==index )
        end
        @grouped_array.insert(found_flag+1, new_row)
      else
        new_row = []
        new_row << current_row[index]
        current_row.each_with_index do |obj,i|  
           new_row << obj unless (i ==index ) 
        end
        @grouped_array << new_row
      end
    end
    @grouped_array
  end
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
  def find_element element
    i = -1
    @grouped_array.each_with_index do |current_row, index_of_row|
      
        if current_row ==nil
          i=0
        elsif current_row [0] == element
          i =  index_of_row
        end
          
    end
    i  
  end
#------------------------------------------------------------------------------- 

#-------------------------------------------------------------------------------
  def group_again parent_index,limits_array,new_group_index
    groups_number = limits_array.length
    groups_number = groups_number/2
    
    temp_big_array = @grouped_array
    @temp_grouped_array = @grouped_array
    new_grouped_array = []
    groups_number.times() do |i|  
      
      new_grouped_array = temp_big_array.slice(limits_array[i*2], limits_array[i*2+1]) if (i != 0)
      new_grouped_array = temp_big_array.slice(limits_array[i*2], limits_array[i*2+1]+1) if (i == 0)
      new_grouped_array.length.to_int.times() do |e|  
        new_grouped_array[e] = new_grouped_array[e].last(new_grouped_array[e].length.to_int - parent_index - 1)
        
      end
      k2 = GroupingEngine.new(new_grouped_array)
      new_grouped_array2 = k2.group(new_group_index)
      
      temp_index = 0
      temp_big_array.each_with_index do |it,ind|
        if(ind < limits_array[i*2])
        elsif (ind > limits_array[i*2+1])
          break
        else
          j = it.length.to_int - parent_index - 1
          j.times() { it.pop  }
          
          j.times() do |e|  
            
            
            it << (new_grouped_array2[temp_index][e])
          end
          temp_index +=1
          break if(new_grouped_array2[temp_index]== nil) 
        end
      end
      
    end
    temp_big_array
  end
#-------------------------------------------------------------------------------
  
#-------------------------------------------------------------------------------
  def check_parent_limits parent_index
    @limits = []
    i = 0
    @grouped_array.each_with_index do |current_row, index|
      if current_row[parent_index] != ""
        @limits[i] = index -1
        @limits[i + 1] = index
        i +=2
      end
    end
    @limits.delete(-1)
    last_index = @grouped_array.length;
    last_index -= 1
    @limits << last_index
    @limits
  end
#-------------------------------------------------------------------------------  

  
  
#-------------------------------------------------------------------------------  
  def group_by(*args1)
    args = args1[0]
    out_put = []
    out_put = group(args[0])
    (args.length.to_int-1).times do |i|
      (args.length.to_int-i).times() { |l| args[i+l] -=1 if (args[i+l] > args[i]) }
      out_put = group_again(i, check_parent_limits(i),args[i+1])
    end
    out_put
  end
#-------------------------------------------------------------------------------  
end




