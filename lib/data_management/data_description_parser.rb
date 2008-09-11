module DataManagement
  #This class is resposible for dealing with The YAML file that contains the description 
  #of the data that is required from the data source
  class DataDescriptionParser
    require 'rubyrt'
    #This method instantiates from the YAML dealer and then load the data 
    #from the data description YAML file
    def self.parse data_description_path,param_path
      yaml_dealer = YAMLDealer.new
      data_description=yaml_dealer.load_yaml data_description_path
      param=yaml_dealer.load_yaml param_path
      return  param,data_description
    end
  end
end