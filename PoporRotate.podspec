#
# Be sure to run `pod lib lint PoporRotate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PoporRotate'
  s.version          = '1.3'
  s.summary          = '屏幕旋转逻辑'
  s.description      =
  '简化屏幕旋转逻辑, 包含使用陀螺仪检测当前屏幕方向代码; UIInterfaceOrientationMask和UIDeviceOrientation转换; 陀螺仪检测当前屏幕方向; '

  s.homepage         = 'https://github.com/popor/PoporRotate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popor' => '908891024@qq.com' }
  s.source           = { :git => 'https://github.com/popor/PoporRotate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PoporRotate/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PoporRotate' => ['PoporRotate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
