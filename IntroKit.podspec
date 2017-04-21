#
# Be sure to run `pod lib lint IntroKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IntroKit'
  s.version          = '1.0'
  s.summary          = 'A short description of IntroKit.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sumitmukhija/IntroKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sumitmukhija' => 'sumitmukhija@hotmail.com' }
  s.source           = { :git => 'https://github.com/sumitmukhija/IntroKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sumitmukhija'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IntroKit/Classes/**/*'
  
  s.resource_bundles = {
  'IntroKit' => ['IntroKit/Assets/*{.storyboard,.xcassets}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
