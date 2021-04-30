# -*- mode: ruby; -*-
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, 'repeat last command' do
  pry_instance.run_command Pry.history.to_a.last
end

# Prompt with ruby version
Pry.config.prompt = Pry::Prompt.new(
  "custom",
  "my custom prompt",
  [
    proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " },
    proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }
  ]
)
