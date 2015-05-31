if defined?(ActiveRecord)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

begin
  require 'pry-meta'
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry"
end
