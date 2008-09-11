module OutputExporting
  class CssGenerator
    def self.generate report_skeleton
      css_string= ""
      #----------------body format-------------------------------- 
      css_string="body{
    background-color: "<< report_skeleton['background-color']
      css_string<<"}\n" 
      #---------------title format--------------------------------
    report_skeleton["title"].each_index do |index|
           css_string<<".title"<< index.to_s << 
          "{font-size: "  <<  report_skeleton["title"][index]["style"]["font-size"] << ";"  <<
          "font-family: " << report_skeleton["title"][index]["style"]["font-face"] << ";" <<
          "text-align: "<< report_skeleton["title"][index]["style"]["align"] << ";" <<
          "color: " << report_skeleton["title"][index]["style"]["font-color"] << ";" <<
          "font-style: " << report_skeleton["title"][index]["style"]["font-style"] << ";" <<
          "font-weight: " << report_skeleton["title"][index]["style"]["font-weight"] << ";" <<
          "position: " << report_skeleton["title"][index]["style"]["position"] << ";" <<
          "top: " << report_skeleton["title"][index]["style"]["top"] << ";" <<
          "bottom: " << report_skeleton["title"][index]["style"]["bottom"] << ";" <<
          "left: " << report_skeleton["title"][index]["style"]["left"] << ";" <<
          "right: " << report_skeleton["title"][index]["style"]["right"] << ";" <<
          "background-color: "<< report_skeleton["title"][index]["style"]["background-color"] << ""
           css_string<<"}\n"
      end
      #-------------headers format-------------------------------------
     report_skeleton["column_headers"].each_index do |index|
        css_string<<".th" << index.to_s << "{
        font-family: " << report_skeleton["column_headers"][index]["style"]["font-face"] << ";" <<
        "text-align: " << report_skeleton["column_headers"][index]["style"]["align"]  << ";" <<
        "color: " << report_skeleton["column_headers"][index]["style"]["font-color"]  << ";" <<
        "font-style: " << report_skeleton["column_headers"][index]["style"]["font-style"]  << ";" <<
        "font-weight: " << report_skeleton["column_headers"][index]["style"]["font-weight"]  << ";" <<
        "background-color: " << report_skeleton["column_headers"][index]["style"]["background-color"]  << ";" <<
        "font-size: " << report_skeleton["column_headers"][index]["style"]["font-size"]  << ";" <<
        "}\n"
     end
       #-------------column footers format-------------------------------------
     report_skeleton["column_footers"].each_index do |index|
        css_string<<".column_footer" << index.to_s << "{
        font-family: " << report_skeleton["column_footers"][index]["style"]["font-face"] << ";" <<
        "text-align: " << report_skeleton["column_footers"][index]["style"]["align"]  << ";" <<
        "color: " << report_skeleton["column_footers"][index]["style"]["font-color"]  << ";" <<
        "font-style: " << report_skeleton["column_footers"][index]["style"]["font-style"]  << ";" <<
        "font-weight: " << report_skeleton["column_footers"][index]["style"]["font-weight"]  << ";" <<
        "background-color: " << report_skeleton["column_footers"][index]["style"]["background-color"]  << ";" <<
        "font-size: " << report_skeleton["column_footers"][index]["style"]["font-size"]  << ";" <<
        "}\n"
     end
      #-----------records format---------------------------------------
      report_skeleton["details"].each_index do |index|
          css_string<<".tr" << index.to_s << "{
          font-family:" << report_skeleton["details"][index]["style"]["font-face"] << ";" <<
          "text-align:" << report_skeleton["details"][index]["style"]["align"] << ";" <<
          "color:" << report_skeleton["details"][index]["style"]["font-color"]  << ";" <<
          "font-style:" << report_skeleton["details"][index]["style"]["font-style"]  << ";" <<
          "font-weight:" << report_skeleton["details"][index]["style"]["font-weight"]  << ";" <<
          "background-color:" << report_skeleton["details"][index]["style"]["background-color"] << ";" <<
          "font-size:" << report_skeleton["details"][index]["style"]["font-size"] << ";" <<
          "}\n"
        end
         #-----------last_page_footer format---------------------------------------
      report_skeleton["last_page_footer"].each_index do |index|
          css_string<< ".last_page_footer" << index.to_s << "{
          font-size: " << report_skeleton["last_page_footer"][index]["style"]["font-size"] << ";" <<
          "font-family: " << report_skeleton["last_page_footer"][index]["style"]["font-face"] << ";" <<
          "text-align: "<< report_skeleton["last_page_footer"][index]["style"]["align"] << ";" <<
          "color: " << report_skeleton["last_page_footer"][index]["style"]["font-color"] << ";" <<
          "font-style: " << report_skeleton["last_page_footer"][index]["style"]["font-style"] << ";" <<
          "font-weight: " << report_skeleton["last_page_footer"][index]["style"]["font-weight"] << ";" <<
          "background-color: "<< report_skeleton["last_page_footer"][index]["style"]["background-color"] << ""
          css_string<<"}\n"
        end
      #-----------summary format---------------------------------------
      report_skeleton["summary"].each_index do |index|
          css_string<<".summary" << index.to_s << "{
          font-size: " << report_skeleton["summary"][index]["style"]["font-size"] << ";" <<
          "font-family: " << report_skeleton["summary"][index]["style"]["font-face"] << ";" <<
          "text-align: "<< report_skeleton["summary"][index]["style"]["align"] << ";" <<
          "color: " << report_skeleton["summary"][index]["style"]["font-color"] << ";" <<
          "font-style: " << report_skeleton["summary"][index]["style"]["font-style"] << ";" <<
          "font-weight: " << report_skeleton["summary"][index]["style"]["font-weight"] << ";" <<
          "background-color: "<< report_skeleton["summary"][index]["style"]["background-color"] << ""
          css_string<<"}\n"
        end
     #-----------business logic format---------------------------------------
     report_skeleton["css"].each do |css|
                css_string << css
            end#end of block
  #------------------result string----------------------------------
      File.open(report_skeleton["parent_path"] + report_skeleton["name"]  +  '.css', 'w') { |f| f.puts css_string }
    end
  end
end