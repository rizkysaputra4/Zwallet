# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

use_frameworks!

workspace 'Zwallet'

def common_dependency
  pod 'Kingfisher', '~> 6.0'
  pod 'SkeletonView'
end

target 'App' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for App
  pod 'Moya'
  pod 'netfox', :configurations => ['Debug']
  common_dependency
end

target 'Core' do
  project '../Module/Core/Core'
  pod 'Moya'
  common_dependency
end

target 'History' do
  project '../Module/History/History'
  common_dependency
end

target 'Home' do
  project '../Module/Home/Home'
  common_dependency
end

target 'Register' do
  project '../Module/Register/Register'
  common_dependency
end 

target 'Login' do
  project '../Module/Login/Login'
  common_dependency
end

target 'CreatePin' do
  project '../Module/CreatePin/CreatePin'
  common_dependency
end 

target 'ConfirmOtp' do
  project '../Module/ConfirmOtp/ConfirmOtp'
  common_dependency
end

target 'Transfer' do
  project '../Module/Transfer/Transfer'
  common_dependency
end