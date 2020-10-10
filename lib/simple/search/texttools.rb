module Simple
  module Search
    def self.normalize(text)
      text = text.downcase
      text = text.gsub(/[[:punct:]]/,'')
      text
    end
  end
end
