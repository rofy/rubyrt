
Gem::Specification.new do |s|
  s.name = "rubyrt"
  s.version = "0.0.1"
  s.date = "2008-09-10"
  s.summary = "Rubyrt is a reporting tool built in Ruby"
  s.email = "rofaida.awad@espace.com.eg"
  s.homepage = "http://github.com/rofy/rubyrt"
  s.description = "Rubyrt is a reporting tool, that works on activerecord as the data-source and outputs HTML/CSS generated reports"
  s.has_rdoc = true
  s.authors = ["Rofaida Awad" , "Hussein Nomier" , "Ahmed Saeed" , "Mohamed Salah", "Salma El Shehaby"]
  s.files = [
    "rubyrt.gemspec",
	"README",
	"Rubyrt_0.0.1_Manual.pdf",
	"lib/rubyrt.rb",
    "examples/configuration_example.yml",
    "examples/eSpace_Employees.css",
    "examples/eSpace_Employees.html",
    "lib/config/default.yml",
	"lib/config/new_format.yml",
	"lib/config/rubyrt_schema.yml",
	"lib/config/template.html.erb",
	"lib/data_management/data_description_parser.rb",
	"lib/data_management/data_src_adapter_factory.rb",
	"lib/data_management/grouping.rb",
	"lib/data_management/rubyrt_compiler.rb",
	"lib/data_management/statistics_engine.rb",
	"lib/helpers/template_loader.rb",
	"lib/input_importing/database_adapter.rb",
	"lib/output_exporting/css_generator.rb",
	"lib/output_exporting/html_exporter.rb",
	"lib/output_exporting/output_exporter_factory.rb",
	"lib/rubyrt_adapter/rubyrt.rb",
	"lib/YAML/kwalify_dealer.rb",
	"lib/YAML/yaml_dealer.rb"
  ]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
  s.add_dependency('erubis', '>= 2.6.2')
  s.add_dependency('kwalify', '>= 0.7.1')
  s.add_dependency('activerecord', '>= 2.1.0') 

end