Pod::Spec.new do |s|
  s.name         = "HYQSFlow"
  s.version      = "0.0.1"
  s.summary      = "HYQSFlow,water flow"
  s.homepage     = "https://github.com/Otherplayer/HYQSFlow"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Otherplayer' => 'osmk@qq.com' }
  s.source       = { :git => "https://github.com/Otherplayer/HYQSFlow.git", :tag => '0.0.1' }
  s.platform     = :ios
  s.ios.deployment_target = '5.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
  s.dependency "SDWebImage", "~> 3.7.3"
end
