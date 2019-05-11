module SimpleStore
  class Engine
    COMMANDS = [
      'SET',
      'GET',
      'DELETE',
      'COUNT',
      'BEGIN',
      'COMMIT',
      'ROLLBACK',
      'EXIT'
    ]

    attr_reader :command

    def run
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
        get_current_command

        unless valid_command?
          puts 'please select a valid command'
          next
        end

        if exiting?
          puts 'Thank you for using Simple Store'
          break
        end
      end
    end

    private

    def valid_command?
      COMMANDS.include?(command)
    end

    def get_current_command
      @command = gets.chomp
    end

    def exiting?
      command == 'EXIT'
    end
  end
end
