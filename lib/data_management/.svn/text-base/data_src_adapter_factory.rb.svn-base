module DataManagement 
  
  class DataSrcAdapterFactory 
    
    def initialize(*args)
      @data_description_hash , @parameters , @properties_instance_var ,@parameters_instance_var     = 
      args[0][:data_description_hash] , args[0][:parameters],args[0][:adapter_properties], args[0][:adapter_parameters]
    end

   def method_missing(method,&block)
       require'rubyrt'
        input_importer = Object.new             #to be able to call instance_eval 
        if block.is_a? Proc                     # more flexible than block_given?
          adapter = input_importer.instance_eval(&block)
        else
          adapter = input_importer.instance_eval("#{method.to_s.capitalize!}Adapter.new")
        end
        adapter.instance_variable_set(@properties_instance_var, @data_description_hash["properties"])
        adapter.instance_variable_set(@parameters_instance_var, @parameters)
        adapter
      end   # end of method_missing
  end       # end of class 
end         # end of module 


   