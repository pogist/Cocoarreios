# Cocoarreios

[![CI Status](http://img.shields.io/travis/pogist/Cocoarreios.svg?style=flat)](https://travis-ci.org/pogist/Cocoarreios)
[![Version](https://img.shields.io/cocoapods/v/Cocoarreios.svg?style=flat)](http://cocoapods.org/pods/Cocoarreios)
[![License](https://img.shields.io/cocoapods/l/Cocoarreios.svg?style=flat)](http://cocoapods.org/pods/Cocoarreios)
[![Platform](https://img.shields.io/cocoapods/p/Cocoarreios.svg?style=flat)](http://cocoapods.org/pods/Cocoarreios)

📬 A pure Swift implementation of some services for brazilian state post office: Correios.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

+ Swift 4 or higher

## Usage

Request information about an address based on the given cep.

```swift
...

override func viewDidLoad() {
  super.viewDidLoad()
  
  Cocoarreios.request(.address(cep: "01001000")) { result in
    switch result {
    case .success(let address):
      print(address.cep)          // => "01001-000"
      print(address.publicPlace)  // => "Praça da Sé"
      print(address.complement)   // => "lado ímpar"
      print(address.neighborhood) // => "Sé"
      print(address.city)         // => "São Paulo"
      print(address.state)        // => "SP"
      print(address.unity)        // => ""
      print(address.ibge)         // => "3550308"
      print(address.gia)          // => "1004"

    case .failure(let error):
      //Do something with error...  
    }
  }
}

...
```

## Installation

Cocoarreios is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Cocoarreios'
```

## Author

pogist, murilo.paixao.2@gmail.com

## License

Cocoarreios is available under the MIT license. See the LICENSE file for more info.
