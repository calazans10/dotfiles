Pry.config.editor = ENV.fetch("EDITOR", "subl -w")

Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails)
  begin
    require "rails/console/app"
    require "rails/console/helpers"

    TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods
  rescue LoadError => e
    require "console_app"
    require "console_with_helpers"
  end
end

begin
  require 'pry-meta'

  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers
      .stagger_output("=> #{value.ai}", output)
  end
rescue LoadError => err
  puts "Unable to load pry-meta"
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
