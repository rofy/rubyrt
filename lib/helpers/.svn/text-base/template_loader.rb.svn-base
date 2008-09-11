module Helpers
  
  class TemplateLoader
    #This class is used to load any HTML template from a text file
    #You can use it as follows: 
    #index_page = TemplateLoader.load_html_templates("html_template.txt")  
     
    def self.load_html_templates(file_name)
      begin
        file = File.new(file_name, "r")
        html = ""
        while (line= file.gets)
          html << line
        end
        file.close
      rescue => err
        puts "Exception: #{err}"
      end
      return html
    end
     
  end
end