Pod::Spec.new do |spec|
    spec.name = 'Kactus-Framework'
    spec.version = '0.1'
    spec.authors = { 'Andreatta Massimiliano' => 'massimiliano.andreatta@gmail.com' }
    spec.homepage = 'https://github.com/maxandreatta/Kactus-Framework'
    spec.summary = 'A framework for iOS'
    spec.license = { :type => 'MIT' }
    spec.requires_arc = true
    spec.source = { :git => 'https://github.com/maxandreatta/Kactus-Framework.git', :tag => "#{spec.version}" }
    spec.source_files = 'Kactus/*.{h,m}'
    # spec.framework = 'UIKit', 'QuartzCore', 'Foundation'
    spec.platform = :ios, '7.0'
end
