module OutputExporting

# MANUAL for using this class, we will do the following steps::
#================================================================

# 1) You must include the module of the outputExporting
#     include OutputExporting

# 2)CASE I:: In case of block given,  which is the case of adding a new Exporter, that was not previously supported::
#---------------------------------------------------------------------------------------------------------------------------------------
#    outputExporter =  OutputExporterFactory.xml {XmlExporter.new} 
#    outputExporter.export report_sekelton ( to start exporting the data )  

#You should take care that any new format added should be a class named FormatExporter (where Exporter is a common suffix) and it should 
#be a member in the OutputExporting module and its file must be called format_exporter.rb (where _exporter.rb is a common suffix)

# 2)CASE II:: Case of no block given , which is when we are using an already supported exporter like PdfExporter of HtmlExporter::
#----------------------------------------------------------------------------------------------------------------------------------------
#     OutputExporterFactory.pdf.export report_skeleton     
#=================================================================================================================================================
  class OutputExporterFactory
    
    #method_missing is used for supporting any output_format method called on this class , whether it was previously supported or not...
    
    def self.method_missing(method,&block)
      require "rubyrt" 
      output_exporter = Object.new            #to be able to call instance_eval 
      if block.is_a? Proc                     # more flexible than block_given?
         output_exporter.instance_eval(&block)
      else
         output_exporter.instance_eval("#{method.to_s.capitalize!}Exporter.new")
      end
    end   # end of method_missing
  end     #end of class OutputExporterFactory 
end       # end of module OutputExporting



   