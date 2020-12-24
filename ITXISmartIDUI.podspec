Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '11.4'
s.name = "ITXISmartIDUI"
s.summary = "The UI that we use on top of SmartIDEngine."
s.requires_arc = true

s.version = "0.1.1"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Rida Hallal" => "rida@itx.com.lb" }

s.homepage = "https://github.com/ridaitxi/ITXISmartIDUI"

s.source = { :git => "https://github.com/ridaitxi/ITXISmartIDUI.git", 
             :tag => "#{s.version}" }

s.framework = "UIKit"

s.source_files = "ITXISmartIDUI/**/*.{h,m}"

s.resources = "ITXISmartIDUI/**/*.{png,xib}"

end