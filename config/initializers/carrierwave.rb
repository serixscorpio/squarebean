if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true
  end
end

unless Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.enable_processing = true
  end
end
