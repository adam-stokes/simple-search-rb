module Simple
  module Search
    class Store
      def initialize()
        @index = RecordResult.new
      end

      def add(text)
        record = Record.new(text)
        @index.add(record)
      end

      def search(term)
        term_sanitized = Simple::Search::normalize(term)
        matches = RecordResult.new
        @index.records.each do |record|
          if record.terms.include?(term_sanitized)
            matches.add(record)
          end
        end
        matches
      end
    end
  end
end
