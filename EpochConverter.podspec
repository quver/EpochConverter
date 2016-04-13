Pod::Spec.new do |s|
  s.name                  = "EpochConverter"
  s.version               = "1.0"
  s.license               = "MIT"
  s.summary               = "Epoch Converter for iOS and OSX"
  s.homepage              = "https://github.com/quver/EpochConverter"
  s.author                = { "Pawel Bednorz" => "pawel@quver.pl" }
  s.social_media_url      = "https://twitter.com/plquver"
  s.source                = { :git => "https://github.com/quver/EpochConverter.git", :tag => s.version }
  s.public_header_files   = "EpochConverter/EpochConverter.h"
  s.source_files          = "EpochConverter/EpochConverter.h"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true
end
