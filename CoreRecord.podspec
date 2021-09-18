Pod::Spec.new do |s|
  s.name         = "CoreRecord"
  s.version      = "0.0.1"
  s.summary      = "ActiveRecord for Swift"

  s.description  = <<-DESC
			ActiveRecord style Core Data object management. Tremendously convenient and easy to use. Necessary for any and every Core Data project.

Written purely in Swift and based heavily on [ObjectiveRecord](https://github.com/supermarin/ObjectiveRecord)

This library also reads in your json dictionaries for you. Includes automatic camelCase changing ie `first_name` from server to `firstName` locally. You can customize the dictionary mapping to, read the mapping section. Relationship objects are also generated, but disabled by default. Set `CoreRecord.generateRelationships` to true to enable this feature
                   DESC

  s.homepage     = "https://github.com/stonko1994/CoreRecord"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "David Steinacher" => "david_steinacher@hotmail.com" }
  s.social_media_url   = "http://twitter.com/stonko1994"
  s.ios.deployment_target = "13.0"
  s.osx.deployment_target = "10.15"
  s.source       = { :git => "https://github.com/stonko1994/CoreRecord.git", :tag => "v#{s.version}" }
  s.requires_arc = true

  s.subspec 'Core' do |ss|
    ss.ios.deployment_target = "8.0"
    ss.osx.deployment_target = "10.9"
    ss.source_files  = "Core/**/*.{swift}"
  end

  s.subspec 'Combine' do |ss|
    ss.ios.deployment_target = "13.0"
    ss.osx.deployment_target = "10.15"
    ss.source_files  = "CoreRecord+Combine/**/*.{swift}"
    ss.dependency "CoreRecord/Core"
  end

  s.subspec 'X' do |ss|
    ss.ios.deployment_target = "8.0"
    ss.osx.deployment_target = "10.9"
    ss.source_files  = "CoreRecord+X/**/*.{swift}"
    ss.dependency "CoreRecord/Core"
  end

  s.subspec 'Migration' do |ss|
    ss.ios.deployment_target = "8.0"
    ss.osx.deployment_target = "10.9"
    ss.source_files  = "CoreRecord+Migration/**/*.{swift}"
    ss.dependency "CoreRecord/Core"
  end
end
