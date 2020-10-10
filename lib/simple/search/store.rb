require 'simple/search/record'
module Simple
  module Search
    class Store
      def initialize()
        @index = RecordResult.new
      end

      def add(text)
        record = Record.new(text)
        @index.push(record)
      end

      def search(term)
        term_sanitized = normalize(term)
        matches = RecordResultnew
        @index.records do |record|
          if record.terms.include?(term_sanitized)
            matches.push(record)
          end
        end
        matches
      end
    end
  end
end
