Pod::Spec.new do |spec|
  spec.name         = 'Home'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/TiagoLinharess/app-ios-financial-control-v2.git'
  spec.authors      = { 'Tiago Linhares' => 'tiagolinharessouza@gmail.com' }
  spec.summary      = 'This is a software development kit'
  spec.source       = { :git => 'https://github.com/TiagoLinharess/app-ios-financial-control-v2.git', :branch => 'main', :tag => spec.version }
  spec.platforms    = { :ios => "18.0" }
  spec.swift_version = '5.8.1'
  spec.source_files = 'Home/Home/**/*.swift'
  spec.framework    = 'SystemConfiguration'
  spec.dependency     'Core'
  spec.dependency     'SharpnezDesignSystemSwiftUI'
end