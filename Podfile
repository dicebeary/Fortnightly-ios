platform :ios, '13.0'

workspace 'Fortnightly'
project 'Core/Core.xcodeproj'
project 'Domain/Domain.xcodeproj'
project 'Fortnightly.xcodeproj'

use_frameworks!
inhibit_all_warnings!

target 'Core' do
  project 'Core/Core.xcodeproj'
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'
  pod 'Swinject', '2.7.1'
  pod 'SwinjectStoryboard', '2.2.1'
  pod 'Moya/RxSwift', '~> 14.0'
  pod 'SwiftyMocky', '4.0.4'

  target 'CoreTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest', '~> 5.0'
    pod 'Nimble', '9.0.0'
  end
end

target 'Domain' do
  project 'Domain/Domain.xcodeproj'
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'
  pod 'SwiftyMocky', '4.0.4'

  target 'DomainTests' do
    inherit! :search_paths
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
  pod 'SwiftyMocky', '4.0.4'

  target 'FortnightlyTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 5.0'
    pod 'RxTest', '~> 5.0'
    pod 'Nimble', '9.0.0'
  end

end
