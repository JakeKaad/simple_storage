require_relative 'commands/base'
require_relative 'commands/set'
require_relative 'commands/get'
require_relative 'commands/delete'
require_relative 'commands/count'
require_relative 'commands/null'
require_relative 'commands/exit'


module SimpleStore
  module Commands
    COMMANDS = {
      'SET' => Set,
      'GET' => Get,
      'DELETE' => Delete,
      'COUNT' => Count,
      'BEGIN' => 'Begin',
      'COMMIT' => 'Commit',
      'ROLLBACK' => 'Rollback',
      'EXIT' => Exit,
      'NULL' => Null
    }

    FIRST_WORD_REGEXP = /^[^\s]+/

    def self.create(command)
      action = command.match(FIRST_WORD_REGEXP).to_s || 'Null'
      action = 'NULL' unless COMMANDS.keys.include?(action)
      arguments = command.gsub("#{action} ", '')
      COMMANDS[action].new(arguments)
    end
  end
end
