require 'matrix'
require 'tf-idf-similarity'

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

      def search_by_rank(term)
        matches = search(term)
        records = matches.records.map {|r| r}

        # Create a set of tfidf documents
        documents = records.map {|record| TfIdfSimilarity::Document.new(record.text)}

        # Create tfidf model
        model = TfIdfSimilarity::TfIdfModel.new(documents)
        scores = documents.map {|document| model.tfidf(document, term)}
        scores = records.zip(scores)
        scores.sort_by{|k| -k[1]}
      end
    end
  end
end
