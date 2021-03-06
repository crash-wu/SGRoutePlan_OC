#
# Be sure to run `pod lib lint SGRoutePlan_OC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SGRoutePlan_OC'
  s.version          = '0.0.2'
  s.summary          = '天地图POI搜索，公交路线搜索，驾车路线搜索,逆地址编码等服务工具.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "天地图POI搜索，公交路线搜索，驾车路线搜索,逆地址编码 等服务工具。集成了在地图上展示POI搜索结果(显示大头针)，展示公交规划路线，驾车规划路线等功能"


  s.homepage         = 'https://github.com/crash-wu/SGRoutePlan_OC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '吴小星' => 'crash_wu@163.com' }
  s.source           = { :git => 'https://github.com/crash-wu/SGRoutePlan_OC.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'SGRoutePlan_OC/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SGRoutePlan_OC' => ['SGRoutePlan_OC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'YYModel'


    s.xcconfig = {

    "FRAMEWORK_SEARCH_PATHS" => "$(HOME)/Library/SDKs/ArcGIS/iOS" ,
    "OTHER_LDFLAGS"  => '-lObjC -framework ArcGIS -l c++',

    'ENABLE_BITCODE' => 'NO',
    'CLANG_ENABLE_MODULES' => 'YES'

    }

end
