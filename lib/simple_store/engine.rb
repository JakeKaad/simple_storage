module SimpleStore
  class Engine


    attr_reader :command

    def run
      init_store

      system("clear")
      puts 'Welcome to Simple Store'
      puts 'SET <key> <value> // store the value for key'
      puts 'GET <key> // return the current value for key'
      puts 'DELETE <key> // remove the entry for key'
      puts 'COUNT <value> // return the number of keys that have the given value'
      puts 'BEGIN // start a new transaction'
      puts 'COMMIT // complete the current transaction'
      puts 'ROLLBACK // revert to state prior to BEGIN call'
      puts 'EXIT // exits Simple Store'

      loop do
        puts "What would you like to do?"
        receive_input
        command.process
      end
    end

    private

    def receive_input
      input = gets.chomp
      @command = SimpleStore::Commands.create(input)
    end

    def exiting?
      command == 'EXIT'
    end

    def init_store
      File.open(SimpleStore.store, "a+") do |file|
      end
    end
  end
end
