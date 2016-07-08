Pod::Spec.new do |s|
  s.name         = "CoreDataLite"
  s.version      = "1.1"
  s.summary      = "Coredata boiler plate code."
  s.description  = <<-DESC
                   Coredata boilerplate code.
                   DESC
  s.homepage     = "https://github.com/Flipkart/#{s.name}.git"
  s.license      = 'MIT'
  s.author             = { "prabodhprakash" => "prabodh.prakash@flipkart.com" }
  s.social_media_url   = "http://twitter.com/prabodhprakash"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Flipkart/#{s.name}.git", :tag =>s.version }
  s.source_files  = "classes", "lib/classes/**/*.{h,m}"
  s.exclude_files = "lib/classes/exclude"
end
