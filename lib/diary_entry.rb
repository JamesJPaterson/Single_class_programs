class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @contents_array = @contents.split(" ")
      @bookmark = 0
    end
    
    def title
      # Returns the title as a string 
      return @title 
    end
  
    def contents
      # Returns the contents as a string
      return @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      contents_array = @contents.split(" ")
      return contents_array.count
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      minutes = ((@contents_array.count / wpm) + (@contents_array.count % wpm))
      return minutes
    end
  
    def reading_chunk(wpm, minutes) 
      w = minutes * wpm
      start_from = @bookmark
      end_at = @bookmark + w
      word_list = @contents_array[start_from...end_at]
      
      if end_at >= @contents_array.count
        @bookmark = 0
      else 
        @bookmark = end_at
      end      
      return word_list.join(" ")
    end
end