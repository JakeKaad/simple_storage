require 'json'

module SimpleStore
  module Commands
    class Base
      attr_reader :arguments

      def initialize(arguments)
        @arguments = arguments
      end

      def exit?
        false
      end

      def valid?
        true
      end

      private

      def key
        @key ||= arguments.match(FIRST_WORD_REGEXP).to_s
      end

      def value
        @value ||= arguments.gsub("#{key} ", '')
      end

      def store
        @store ||= open_storage(SimpleStore.store)
      end

      def transaction_store
        @transaction_store ||= open_storage(SimpleStore.transaction_store)
      end

      def open_storage(path)
        JSON.parse(File.read(path))
      rescue
        {}
      end

      def stores
        store.merge(
          transaction_store.reject {|k, _| k == '__DELETES__'}
        ).reject do |k, _|
          transaction_store['__DELETES__'] &&
            transaction_store['__DELETES__'].include?(k)
        end
      end

      # TODO delegate storage logic to its own modulea
      def save
        File.open(SimpleStore.store, "w+") do |file|
          file << store.to_json
        end
      end

      def save_to_transaction
        File.open(SimpleStore.transaction_store, "w+") do |file|
          file << transaction_store.to_json
        end
      end

      def in_transaction?
        File.exists?(SimpleStore.transaction_store)
      end

      def end_transaction
        File.delete(SimpleStore.transaction_store) if in_transaction?
      end
    end
  end
end
