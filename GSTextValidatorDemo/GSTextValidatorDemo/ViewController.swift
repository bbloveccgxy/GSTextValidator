//
//  ViewController.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/20.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,GSTextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textfield : GSTextField = GSTextField(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
        textfield.backgroundColor = UIColor.lightGray
        textfield.gsDelegate = self
        textfield.validateDescription = "username"
        self.view.addSubview(textfield)
        
        textfield.add(validators: GSTextValidator.isEmpty(),GSTextValidator.lessThan(length:5),GSTextValidator.moreThan(length:2))
    }
    
    func textFieldDidEndValidate(result: String, length: Int, description: String?) {
        print(result)
        print(length)
        if let des = description {
            print(des)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

