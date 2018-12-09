def formatted_env
  case Rails.env
  when 'production'
    Pry::Helpers::Text.red(Rails.env)
  when 'staging'
    Pry::Helpers::Text.yellow(Rails.env)
  when 'development'
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def app_name
  File.basename(Rails.root)
end

if defined?(Rails)
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  Pry.config.prompt = proc do |target_self, nest_level, pry|
    "[#{app_name}][#{formatted_env}][#{pry.input_array.size}] #{pry.config.prompt_name}(#{Pry.view_clip(target_self)})#{":#{nest_level}" unless nest_level.zero?}> "
  end
end