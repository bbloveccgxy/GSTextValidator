//
//  GSTextView.swift
//  GSTextValidatorDemo
//
//  Created by gxy on 2017/3/22.
//  Copyright © 2017年 GaoXinYuan. All rights reserved.
//

import UIKit

class GSTextView: UITextView,UITextViewDelegate {

    //MARK:Override init
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///GSTextFieldDelegate
    weak open var gsDelegate: GSTextFieldDelegate?
    
    ///a string of the textField's description, which could be used in delegate func
    var validateDescription : String?
    
    
    /// Add validator(s) to the textField
    ///
    /// - Parameter validators: validator which is the subClass of GSTextBaseValidator
    func add(validators : GSTextBaseValidator...) -> Void {
        for item in validators {
            if item is GSTextLessThanValidator {
                self.lessThanValidator = item as? GSTextLessThanValidator
            }
            else {
                self.validatorArray.append(item)
            }
        }
    }
    
    //MARK:UITextView Delegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.gsDelegate != nil {
            for validator in self.validatorArray {
                if !validator.validateWith(text: textView.text) {
                    self.gsDelegate?.textFieldDidEndValidate(result: validator.result!, length: validator.length!, description: self.validateDescription)
                }
            }
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if self.gsDelegate != nil {
            if let validator = self.lessThanValidator{
                var validateText:String?
                if let text = textView.text {
                    validateText = text + text
                }
                else {
                    validateText = text
                }
                
                if !validator.validateWith(text: validateText) {
                    self.gsDelegate?.textFieldDidEndValidate(result: validator.result!, length: validator.length!, description: self.validateDescription)
                    
                    return false
                }
            }
        }
        
        return true
    }

    
    //MARK: private variable
    private lazy var validatorArray : [GSTextBaseValidator] = []
    private lazy var lessThanValidator : GSTextLessThanValidator? = nil

}
