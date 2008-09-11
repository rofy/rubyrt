module InputImporting
  
 class DatabaseAdapter 
    require 'active_record'  
    #---------------------------------------------------------------------------------------  
    #This method takes a block as a parameter and executes this block 
    #the block should return the data in the form of array of tables
    #each table is array of records each record is an array(array 3d)
    def get_data &block
      yield
    end
    
    #---------------------------------------------------------------------------------------  
    #this method takes an sql statement and returns an array 3d of the data  
    def get_data *args
      fields_array = []
      @parameters_hash.each_with_index do  |table_fields,index|
        fields_array[index]={}
        table_fields.each_with_index do |field,field_index|
          fields_array[index][field]=field_index
        end
      end
          @result =[]
      if(args[0][:sql_statements]!=nil)
          ActiveRecord::Base.establish_connection(  
          :adapter => @properties_hash["adapter"],  
          :host =>     @properties_hash["host"],  
          :username => @properties_hash["username"],
          :password => @properties_hash["password"],
          :database => @properties_hash["database"],
          :encoding => @properties_hash["encoding"]
          )
         args[0][:sql_statements].each_with_index do |current_statement,current_table_index|
            current_table_fields=fields_array[current_table_index]
            current_table = []
            temporary_table_class = Class.new(ActiveRecord::Base)
            temporary_table_class.set_table_name(@properties_hash["table"][0])
            
            #sql_fetched_data is array of classes coming from the Active Record 
            sql_fetched_data = (temporary_table_class.find_by_sql current_statement) 
            sql_fetched_data.each_with_index  do |array_element,current_record_number|
              current_table[current_record_number] = []     # current_table is the very big array that will contain all tables
              array_element.attributes.each do |key,value|  # iterating over each table to convert attributes hashes to two dimensional array
            
                current_table[current_record_number][current_table_fields[key]]=value
              end
            end
            @result << current_table
          end
          
      elsif(args[0][:existing_data]!=nil )
     
          args[0][:existing_data].each_with_index do|table,table_index|
              current_table_fields=fields_array[table_index]
              current_table=[]            
              table.each_with_index do |record_class,record_number|
                record_class.attributes.each do|field,value|
                  current_table[record_number][current_table_fields[field]]=value
                 end
               end
               @result << current_table
          end
      end    #end of else
      @result
    end       #end of function
#=====================================================================================================================================

 end    #end of class DatabaseAdapter
end # end of module InputImporting