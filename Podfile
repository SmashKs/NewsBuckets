# open source
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

target 'NewsBasket' do
  # For Reactive Programming
  pod 'RxSwift', '~> 4.4.0'
  pod 'RxCocoa', '~> 4.4.0'
  
  # For Image
  pod 'RxKingfisher', '~> 0.3.1'
  pod 'Kingfisher', '~> 4.10.1'
  
  # For Logging
  pod 'SwiftyBeaver', '~> 1.6.1'
  
  # For Dependency Injection
  pod 'Swinject', '~> 2.5.0'
  
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'
  
  target 'DataManager' do
    inherit! :search_paths
    # For RESTful Internet Request
    # pod 'Moya/RxSwift', '~> 12.0.1'
    # pod 'EVReflection/MoyaRxSwift', '~> 5.8.0'
    
    # For Json
    pod 'SwiftyJSON', '~> 4.2.0'
    
    # For Data Storage
    pod 'Realm', '~> 3.11.2'
    pod 'RealmSwift', '~> 3.11.2'
    
    # For Dependency Injection
    pod 'Swinject', '~> 2.5.0'
  end
  
  target 'Utility' do
    inherit! :search_paths
    # For Logging
    pod 'SwiftyBeaver', '~> 1.6.1'
  end
  
  #  target 'NewsBucketsTests' do
  #    inherit! :search_paths
  #    pod 'RxBlocking', '~> 4.0'
  #    pod 'RxTest', '~> 4.0'
  #  end
  #  target 'NewsBucketsUITests' do
  #    inherit! :search_paths
  #    # Pods for testing
  #  end
end
