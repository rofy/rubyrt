module OutputExporting
  
  #This class is responsible for generating the html report file 
  #It makes a template for the output and then fill it with the data  
  #it instantiates from the css_generator class which generates the css file for the report
  class HtmlExporter
    require 'erubis'
    require 'rubyrt'

    

    #This method creates the html templates and uses ERB to fill it with data and then instantiates from the css generator 
    #to create the css file for the report
    #@param data :represents the data structure that stores the format template filled with the data
    def export skeleton
       @tables_counter = []
       skeleton["column_headers"].each_index do | index |
         @tables_counter << index
       end
      @title,@data,@fields,@summary,@last_page_footer, @column_footer =skeleton["title"],skeleton["details"], skeleton["column_headers"],skeleton["summary"], skeleton["last_page_footer"], skeleton["column_footers"]
      @path =  skeleton["name"] + '.css'
      template =  TemplateLoader.load_html_templates $rubyrt_template
      result= Erubis::FastEruby.new(template).result(binding())
      File.open(skeleton["parent_path"] + skeleton["name"] + '.html', 'w') { |f| f.puts result }
      CssGenerator.generate skeleton
      result
    end
  end
end