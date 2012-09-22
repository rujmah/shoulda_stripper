module ShouldaStripper
  class BuildUrls
    attr_reader :lines
    attr_accessor :filename

    def initialize(filename)
      @filename = filename
      @lines = open_file
    end

    def open_file
      IO.readlines(@filename)
    end

    def get_response(line)
      {
        response: ($1 if line =~ /add_response (.*)\Z/),
        tabs: tab_count(line)
      }
    end
    
    def response_lines
      h = []
      @lines.each do |i|  
        if i =~ /\A *add_response/
          h << get_response(i)
        end
      end
      h
    end

    def tab_count(str)
      str[/\A */].size / 2
    end

    def get_context(line)
      {
        context: ($1 if line =~ /context "(.*)" do/),
        tabs: tabcount(line)
      }
    end  

    def context_lines
      ctxt = []
      @lines.each do |i|
        ctxt << get_context(i) if i =~ /\A *context \"/
      end
    end
    
  end
end
