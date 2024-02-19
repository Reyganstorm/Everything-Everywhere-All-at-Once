//
//  CheckTestViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.02.2024.
//

import UIKit

enum XError: Error {
    case BAR
}

class CheckTestViewController: UIViewController , FlowController {
    
    var completionHandler: ((Bool) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
            sampleTextField.placeholder = "Enter text here"
            sampleTextField.font = UIFont.systemFont(ofSize: 15)
            sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
            sampleTextField.autocorrectionType = UITextAutocorrectionType.no
            sampleTextField.keyboardType = UIKeyboardType.default
            sampleTextField.returnKeyType = UIReturnKeyType.done
            sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
            sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            sampleTextField.delegate = self
            self.view.addSubview(sampleTextField)
        
    }
    
    func chekingTheory(text: String?) throws {
        let numberStrhing = "7"
        
        guard numberStrhing == text else {
            return print("No")
        }
        guard "6" == text else {
            throw XError.BAR
        }
        
        print("Finished")
    }

}


extension CheckTestViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            // return NO to disallow editing.
            print("TextField should begin editing method called")
            return true
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            // became first responder
            print("TextField did begin editing method called")
        }

        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
            print("TextField should snd editing method called")
            return true
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
            print("TextField did end editing method called")
        }
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // return NO to not change text
            print("While entering the characters this method gets called")
            return true
        }

        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            // called when clear button pressed. return NO to ignore (no notifications)
            print("TextField should clear method called")
            return true
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // called when 'return' key pressed. return NO to ignore.
            print("TextField should return method called")
            do {
                try chekingTheory(text: textField.text)
            } catch {
                print("com error")
            }
            return true
        }
}
