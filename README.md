# GSTextValidator

## Breif Introduction

An input validator for UITextField and UITextView including some useful validation as if text is empty,text.length is less than...
The goal of this validator is to reduce if()...else()... while there are many TextField or TextView in a single ViewController.

## Usage

This validator should be used with GGTextField or GGTextView.

### Example code
```swift
    let textfield : GSTextField = GSTextField(frame: CGRect(x: 10, y: 10, width: 100, height: 40))
    textfield.gsDelegate = self
    textfield.validateDescription = "username"
    self.view.addSubview(textfield)   
    textfield.add(validators: GSTextValidator.isEmpty(),GSTextValidator.lessThan(length:5),GSTextValidator.moreThan(length:2))
```
In the GSTextField Delegate
```swift
  func textFieldDidEndValidate(result: String, length: Int, description: String?) {
        print(result)
        print(length)
        if let des = description {
            print(des)
        }
  }
 ``` 
## Example is in the demo.

# Look forward to your suggestions!!!
