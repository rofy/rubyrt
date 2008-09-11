module YAML
  
  class YAMLDealer
    
    # This class encapsulates everything that deals with YAML files
    
    require 'yaml'
    
    
    #@yaml_data is an attribute of this class, it holds the data loaded from a YAML file.
    # the attribute yaml_data is [R/W]
    attr_accessor :yaml_data
    
    #================================================================================================================
    # This method is for loading any YAML file,where the loaded data can be accessed after that from the
    # hash @yaml_data 
    # The name of the file should be passed to the method through file_name param
    #Example:
    #yaml_dealer = YAMLDealer.new
    #yaml_dealer.load_yaml "test.yml"   => populates the yaml_data hash with the contents of test.yml file
    
    def load_yaml file_name
      @yaml_data = open(file_name) {|f| YAML.load(f) }
      
    end
    #================================================================================================================
    # This method is for creating any YAML file
    # The name of the file should be passed to the method through file_name param
    # A hash containing the data to be serialized should be passed to the method through data param
    #Example:
    #yaml_dealer = YAMLDealer.new
    #networks = {:office=>"linksys", :home=>"airport"}
    #yaml_dealer.create_yaml "test.yml" , networks       => test.yml file is created
    
    def create_yaml file_name , data
      File.open(file_name +'.yml', 'w') { |f| f.puts data.to_yaml } 
    end
  end
  
  #==============================================================================================================


end
