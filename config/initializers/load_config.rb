app_config_contents = YAML.load_file("#{Rails.root}/config/application.yml")
app_config_contents['default'] ||= {}
APP_CONFIG = app_config_contents['default'].merge(
  app_config_contents[Rails.env] || {} ).symbolize_keys 
