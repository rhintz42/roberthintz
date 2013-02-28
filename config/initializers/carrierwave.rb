CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "AKIAJ7GHKKWWEG3EMSPA",
    aws_secret_access_key: "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"
  }
  config.fog_directory = "roberthintz"
end
