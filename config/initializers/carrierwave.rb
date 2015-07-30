
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAI3HADT3V3SWURN6A',
      :aws_secret_access_key  => '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'
  }
  config.fog_directory  = "viveg-ap-us-0001"
end