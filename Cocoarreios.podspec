Pod::Spec.new do |s|
  s.name             = 'Cocoarreios'
  s.version          = '0.1.0'
  s.summary          = '📬 A pure Swift implementation of some services for brazilian state post office: Correios.'

  s.description      = <<-DESC
📬 A pure Swift implementation of some services for brazilian state post office: Correios. Inspired by https://github.com/paoloo/correios
                       DESC

  s.homepage         = 'https://github.com/pogist/Cocoarreios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pogist' => 'murilo.paixao.2@gmail.com' }
  s.source           = { :git => 'https://github.com/pogist/Cocoarreios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cocoarreios/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Cocoarreios' => ['Cocoarreios/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'Moya', '~> 9.0'
end
