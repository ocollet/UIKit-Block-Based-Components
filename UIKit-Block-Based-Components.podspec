Pod::Spec.new do |s|
  s.name             = "UIKit-Block-Based-Components"
  s.version          = "1.0.0"
  s.summary          = "A few UIKit components that use blocks instead of target/actions or delegates."
  s.description      = <<-DESC
                       A few UIKit components that use blocks instead of target/actions or delegates. The following components are included:

                        * UIActionSheet
                        * UIAlertView
                        * UIBarButtonItem
                       DESC
  s.homepage         = "https://github.com/ocollet/UIKit-Block-Based-Components"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Olivier Collet" => "oc@ocollet.com" }
  s.source           = { :git => "https://github.com/ocollet/UIKit-Block-Based-Components.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ocollet'

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'
end
