# Podfile
use_frameworks!
inhibit_all_warnings!

target 'MVPBlah' do
  pod 'RxSwift', '~> 3.0'
  pod 'RxCocoa', '~> 3.0'
  pod 'Alamofire', '~> 4.4'
  pod 'RxAlamofire'
  #TODO: move to test
  pod 'MockWebServer', :inhibit_warnings => true

end

# RxTests and RxBlocking make the most sense in the context of unit/integration tests
target 'MVPBlahTests' do
  pod 'RxBlocking', '~> 3.0'
  pod 'RxTest', '~> 3.0'
  pod 'RxCocoa', '~> 3.0'
  pod 'MockWebServer'
  pod 'Alamofire', '~> 4.4'
  pod 'RxAlamofire'
end

target 'MVPBlahUITests' do
  pod 'RxBlocking', '~> 3.0'
  pod 'RxTest', '~> 3.0'
  pod 'RxCocoa', '~> 3.0'
  pod 'MockWebServer'
  pod 'Alamofire', '~> 4.4'
  pod 'RxAlamofire'
end
