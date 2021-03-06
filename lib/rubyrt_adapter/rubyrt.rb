module RubyrtAdapter
  #This class is responsible for running the entire flow of the report generation and it's considered the the facade
  #of the core of the report generator
  class Rubyrt
    #requiring files 
    require'rubyrt'  
    #generate report method 
    #This method runs the flow of generating the report from the beginning
    #first it reads the data description and the parameters
    #then it reads the data from the data source
    #then it reads the template that describes the format and fill it with data 
    #then it generates the report with the required format
  def generate_report(*args)
      @data_hash=YAMLDealer.new.load_yaml(args[0][:yaml_path])        #data and parameters parsing
      @default = YAMLDealer.new.load_yaml(args[0][:default_path])  
        load_default_style                                            #loading default values (STYLING ONLY)
      @data_hash["parent_path"] = args[0][:parent_path]               #reading the parent path 
        replace_parameters                                            #method calll , replacing parameters 
    if not args[0][:block]                                            #choosing between block of code and sql statments 
      @new_parameters =[]
      @data_hash["column_headers"].each do |headers|
      @new_parameters << headers["caption"] 
      end#end of block 
      @data= (DataSrcAdapterFactory.new(:data_description_hash => @data_hash["data_source"],
                                       :parameters            => @new_parameters,
                                       :adapter_properties    => :@properties_hash , #name of the adapter instance variable that holds properties
                                       :adapter_parameters    => :@parameters_hash).database).get_data :sql_statements => args[0][:sql_statements]
    else
      @data= (DataSrcAdapterFactory.new(:data_description_hash => @data_hash["data_source"],
                                       :parameters            => @new_parameters,
                                       :adapter_properties    => :@properties_hash , #name of the adapter instance variable that holds properties
                                       :adapter_parameters    => :@parameters_hash).database).get_data args[0][:block]
    end #end of if 
    group #method call(an instance of grouping engine is called) 
    prepare_exporter_input # method call 
    rubyrt_compiler = RubyrtCompiler.new
    @data_hash["css"] = rubyrt_compiler.compile(@data_hash)
      self.instance_eval( "OutputExporterFactory.#{args[0][:output]}.export(@data_hash)" ) #generate the report with the required format
    end # end of method generate_report
#-----------------------------------------------------------------------------------------------------------------------------
    def load_default_style
       #-------------------------------------loading default values (STYLING ONLY) 
       @default.each_pair do |key,value |       
            if value.is_a?(Array)
              value.each_index do |array_element|
                if value[array_element].is_a?(Hash) && value[array_element].has_key?("style") && value[array_element]["style"].is_a?(Hash)
                   value[array_element]["style"].each_pair do |style_key, style_value|
                   if not @data_hash[key][array_element]["style"].has_key?(style_key)
                       @data_hash[key][array_element]["style"][style_key] = style_value
                   end#end of if
                  end#end of block
                end#end of if
              end#end of block
            end#end of if 
          end# end of block 
    end#end of load_default_style
#-----------------------------------------------------------------------------------------------------------------------------
    def  replace_parameters
      @data_hash.each_pair do |key, value|
          if value.class.to_s == "Array"
            array_value = value
            array_value.each do |array_index|
              if array_index.class.to_s == "Hash"
                hash_value = array_index
                if hash_value["type"].class.to_s == "String"
                  if hash_value["type"].upcase! == "PARAMETER"
                    hash_value["caption"] = @data_hash[hash_value["caption"]]
                  end#end of if    
                elsif hash_value["type"].class.to_s == "Array"
                  array_type = hash_value["type"]
                  array_type.each_index do |type|
                     if array_type[type].upcase! == "PARAMETER"
                        hash_value["caption"][type] = @data_hash[hash_value["caption"][type]]
                     end#end of if
                  end#end of block
                end#end of if
              end #end of if
            end # end of block
          end#end of if
         end #end of outer block    
    end # end of method replace_parameters  
#-----------------------------------------------------------------------------------------------------------------------------
    def group
       @data_hash["group_by"].each_index do |index|
       if @data_hash["group_by"][index].length > 0
         inner_index = 0;array = []
        begin 
          array[inner_index] = @new_parameters[index].index(@data_hash["group_by"][index][inner_index]);inner_index +=1
        end while inner_index < (@data_hash["group_by"][index].length)
        grouping = GroupingEngine.new(@data[index]);@data[index] =  grouping.group_by(array)
       end
     end    
    end #end of group
#-----------------------------------------------------------------------------------------------------------------------------
    def  prepare_exporter_input 
      @data.each_index do |index|
        @data[index].each_index do |inner_index|
           temp_array = [];temp_array << @data[index][inner_index];temp_array << "";@data[index][inner_index] = temp_array
        end#end of inner loop
         @data_hash["details"][index]['caption'] = @data[index]
      end#end of outer loop 
    end#end of prepare_exporter_input method           
##============================================================================================================================    
  end   #end of class
end     #end of module 