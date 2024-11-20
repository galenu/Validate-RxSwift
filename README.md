# Validate-RxSwift

[![CI Status](https://img.shields.io/travis/galenu/Validate-RxSwift.svg?style=flat)](https://travis-ci.org/galenu/Validate-RxSwift)
[![Version](https://img.shields.io/cocoapods/v/Validate-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Validate-RxSwift)
[![License](https://img.shields.io/cocoapods/l/Validate-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Validate-RxSwift)
[![Platform](https://img.shields.io/cocoapods/p/Validate-RxSwift.svg?style=flat)](https://cocoapods.org/pods/Validate-RxSwift)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Validate-RxSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Validate-RxSwift'
```

- 输入框校验：Validate
```
        self.textField.validateOnEditingChanged(true)
        
        let emailRule = ValidateRegexRule(regex: "^(?=.{5,100}$)[a-zA-Z0-9._%+-]+@([a-zA-Z0-9-]+\\.)+com$", msg: "邮箱格式错误")
        self.textField.validateRules = [emailRule]
        self.textField.validateResult.subscribe { [weak self] valid in
            guard let `self` = self else { return }
            switch valid {
            case .ok:
                self.textField.textColor = .green
            case .failed:
                self.textField.textColor = .red
            default:
                self.textField.textColor = .black
            }
        }.disposed(by: disposeBag)
```

## Author

galenu, 250167616@qq.com

## License

Validate-RxSwift is available under the MIT license. See the LICENSE file for more info.
