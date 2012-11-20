module RCat
  class Application  
    def initialize(argv)
      @params, @files = parse_options(argv)

      @display = RCat::Display.new @params
    end

    def parse_options(argv)
      parser = OptionParser.new
      params = {}

      parser.on("-n") { params[:line_numbering]  = :all_lines }
      parser.on("-b") { params[:line_numbering]  = :all_nonblank_lines }
      parser.on("-E") { params[:end_marker]     |= :show_end_marker }
      parser.on("-T") { params[:tab_marker]     |= :show_tab_marker }
      parser.on("-s") { params[:squeeze_blank]  |= :squeeze_blank }
      parser.on("-?") { usage }

      files = parser.parse argv
      
      [params, files]
    end

    def usage()
      puts "Usage: rcat [OPTION]... [FILE]..."
      puts "Concatenate FILE(s), or standard input, to standard output.\n\n"
      puts "OPTIONS:"
      puts "  -b   number nonempty output lines"
      puts "  -n   number all output lines"
      puts "  -s   suppress repeated empty output lines"
      puts "  -E   display $ at end of each line"
      puts "  -T   display TAB character as ^I"
      puts ""
      Process.exit
    end

    def run
      if @files.empty?
        @display.render(STDIN)
      else
        @files.each do |file|
          File.open(file) { |f| @display.render(f) }
        end
      end
    end

  end
end


