platform :ios, '13.0'

workspace 'Fortnightly'
project 'Fortnightly.xcodeproj'
project 'Domain/Domain.xcodeproj'
project 'Core/Core.xcodeproj'

use_frameworks!
inhibit_all_warnings!

target 'Core' do
  project 'Core/Core'
  pod 'Swinject', '2.7.1'
  pod 'SwinjectStoryboard', '2.2.1'
  pod 'Moya/RxSwift', '~> 14.0'

  target 'CoreTests' do
    inherit! :search_paths
    pod 'SwiftyMocky', '4.0.4'
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest', '~> 5.0'
    pod 'Nimble', '9.0.0'
  end
end

target 'Domain' do
  project 'Domain/Domain'
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'

  target 'DomainTests' do
    inherit! :search_paths
    pod 'SwiftyMocky', '4.0.4'
  end
end

target 'Fortnightly' do
  project 'Fortnightly.xcodeproj'
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'
  pod 'RxDataSources', '~> 4.0'
  pod 'Kingfisher', '6.3.0'
  pod 'Swinject', '2.7.1'
  pod 'SwinjectStoryboard', '2.2.1'

  target 'FortnightlyTests' do
    inherit! :search_paths
    pod 'SwiftyMocky', '4.0.4'
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest', '~> 5.0'
    pod 'Nimble', '9.0.0'
  end

end
