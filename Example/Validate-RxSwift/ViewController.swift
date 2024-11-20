//
//  ViewController.swift
//  Validate-RxSwift
//
//  Created by galenu on 11/20/2024.
//  Copyright (c) 2024 galenu. All rights reserved.
//

import UIKit
import Validate_RxSwift
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private var disposeBag = DisposeBag()

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}

