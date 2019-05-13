module SimpleStore
  module Commands
    class Delete < Base
      def process
        if in_transaction?
          transaction_store['__DELETES__'] ||= []
          transaction_store['__DELETES__'] << key
          save_to_transaction
        else
          store.delete(key)
          save
        end
      end
    end
  end
end
