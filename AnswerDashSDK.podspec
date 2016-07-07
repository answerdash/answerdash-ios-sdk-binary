Pod::Spec.new do |s|
  s.name = 'AnswerDashSDK'
  s.version = '0.2.0'
  s.summary = 'AnswerDashSDK to integrate AnswerDash with iOS applications'
  s.license = 'Commercial'
  s.authors = {"AnswerDash"=>"support@answerdash.com"}
  s.homepage = 'http://www.answerdash.com/'
  s.libraries = []
  s.requires_arc = true
  s.source = { git: 'https://github.com/answerdash/answerdash-ios-sdk-binary.git', tag: "v#{s.version}" }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'AnswerDashSDK.framework'
  s.ios.frameworks = ["UIKit"]
end
