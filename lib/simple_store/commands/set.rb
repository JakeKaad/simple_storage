module SimpleStore
  module Commands
    class Set < Base
      def process
        if in_transaction?
          transaction_store[key] = value
          save_to_transaction
        else
          store[key] = value
          save
        end
      end
    end
  end
end
