module RCat
  class Display

    END_MARKER = "$"
    TAB_MARKER = "^I"

    def initialize(params)
      @previous_blank = false
      @params = params
      @index = "1"
    end

    def render(file)
      file.each_line { |line| render_line line }
    end

    private

    attr_reader :params, :index, :previous_blank

    def render_line(line)
      line_is_blank = line.chomp.empty?
      
      #squeeze blank lines
      if @params[:squeeze_blank]
        return if @previous_blank && line_is_blank #nothing to do so jump out
        @previous_blank = line_is_blank
      end
      
      mark_tab line if @params[:tab_marker]
      mark_newline line if @params[:end_marker]
      
      #handle line numbering
      case @params[:line_numbering]
      when :all_lines
        prepend_index line
      when :all_nonblank_lines
        if !line_is_blank
          prepend_index line
        end
      end
      
      puts line
    end

    def prepend_index(line)
      line.insert(0, "#{@index.rjust(6)}\t")
      @index.next!
    end

    def mark_tab(line)
      # insert tab markers
      line.gsub!(/\t/, TAB_MARKER)
    end

    def mark_newline(line)
      # insert end markers
      line.gsub!(/\n/, END_MARKER)
    end

  end
end
