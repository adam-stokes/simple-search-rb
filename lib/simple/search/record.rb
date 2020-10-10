require 'securerandom'

module Simple
  module Search
    class Record

      attr_accessor :id, :original_text, :text

      def initialize(text)
        @id = SecureRandom.uuid
        @original_text = text
        @text = Simple::Search::normalize(text)
      end

      def terms
        @text.split(" ")
      end

      def term_frequency
        @text.split(" ").tally
      end
    end

    class RecordResult
      attr_reader :records

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
