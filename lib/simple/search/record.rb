module Simple
  module Search
    class Record

      attr_accessor :id, :original_text, :text

      def initialize(text)
        @id = id
        @original_text = original_text
        @text = normalize(text)
      end

      def terms
        @text.split(" ")
      end

      def term_frequency
        frequency = {}
        @terms.each do |term|
          frequency[term] = {:count => @text.split(" ").size}
        end
        frequency
      end
    end

    class RecordResult
      def initialize()
        @records = []
      end

      def count
        @records.length()
      end

      def add(record)
        @records.push(record)
      end
    end
  end
end
