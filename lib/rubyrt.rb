    #requiring files 
    require'data_management/data_src_adapter_factory'  
    require'data_management/data_description_parser'
    require 'output_exporting/html_exporter'
    require 'output_exporting/output_exporter_factory'
    require 'yaml/yaml_dealer'
    require 'data_management/grouping'
    require 'data_management/rubyrt_compiler'
    require 'input_importing/database_adapter'
    require 'data_management/statistics_engine' 
    require 'output_exporting/css_generator'
    require 'helpers/template_loader'
    require 'output_exporting/html_exporter'
    require 'rubyrt_adapter/rubyrt'
    
    #including modules 
    include DataManagement
    include OutputExporting
    include YAML
    include InputImporting
    include Helpers
    include RubyrtAdapter
    
	$rubyrt_default  = File.dirname(__FILE__) +  './config/default.yml'
	$rubyrt_schema_path  = File.dirname(__FILE__) +  './config/rubyrt_schema.yml'
	$rubyrt_template = File.dirname(__FILE__) +  './config/template.html.erb'