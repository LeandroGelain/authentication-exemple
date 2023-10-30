class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def content_type_whitelist
    %r{image/}
  end
end
