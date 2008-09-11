module YAML
  
  class KwalifyDealer
    require 'kwalify'
    require 'rubyrt'
    
    def load_yaml file_name
      schema = Kwalify::Yaml.load_file($rubyrt_schema_path)
      
      ## create validator
      validator = Kwalify::Validator.new(schema)
      
      ## load document
      kwalify_data = Kwalify::Yaml.load_file(file_name)
      ## validate
      errors = validator.validate(kwalify_data)
      
      ## show errors
      if errors && !errors.empty?
        for e in errors
          puts "[#{e.path}] #{e.message}"
        end
      else
         kwalify_data
      end
     
    end
  end
end