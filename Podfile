platform :ios, '8.0'

source 'https://github.com/alekoleg/AOSpec'
source 'https://github.com/CocoaPods/Specs'

inhibit_all_warnings!

# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

def commonPods()

#common
	pod 'MWFeedParser', '~> 1.0.1'
	pod 'Bolts', '~> 1.6.0'
	pod 'AFNetworking', '~> 3.0.4'
#my
	pod 'VZDateFormatter'
	pod 'CLPLoading'
end

target 'viper' do
  commonPods()
end

target 'viperTests' do
  commonPods()
  pod 'Kiwi', '~> 2.4.0'
end

target 'viperUITests' do
  commonPods()
end
