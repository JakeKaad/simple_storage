require 'json'

module SimpleStore
  module Commands
    class Base
      attr_reader :arguments

      def initialize(arguments)
        @arguments = arguments
      end

      def store
        @store ||= open_storage
      end

      def key
        @key ||= arguments.match(FIRST_WORD_REGEXP).to_s
      end

      def value
        @value ||= arguments.gsub("#{key} ", '')
      end

      def exit?
        false
      end

      def valid?
        true
      end

      def save
        File.open(SimpleStore.store, "w+") do |file|
          file << store.to_json
        end
      end

      private

      def open_storage
        JSON.parse(File.read(SimpleStore.store))
      rescue
        {}
      end
    end
  end
end
