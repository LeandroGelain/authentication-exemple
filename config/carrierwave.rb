CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = ENV['ASSET_HOST']

  if Rails.env.test?
    config.root = Rails.root.join('tmp').to_s
  elsif Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID') { '' },
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY') { '' }
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.storage = :fog
  end
end

if Rails.env.test?
  class CarrierWave::Uploader::Base
    def store_dir
      "public/carrier_wave#{ENV['TEST_ENV_NUMBER']}"
    end

    def cache_dir
      "tmp/carrier_wave#{ENV['TEST_ENV_NUMBER']}"
    end
  end
end
