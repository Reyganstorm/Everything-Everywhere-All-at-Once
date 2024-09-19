//
//  CheckTestViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.02.2024.
//

import UIKit
import Combine


class CheckTestViewController: UIViewController , FlowController {
    
    var completionHandler: ((Bool) -> ())?
    
    let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
    let label = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 300))
    
    let sub = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        addViews()
    }
    
    func chekingTheory(text: String?)  {
        label.text = text
    }
    
    
    private func addViews() {
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
        
        
        
        label.font = .systemFont(ofSize: 20)
        label.text = "Hi"
        label.textColor = .white
        self.view.addSubview(label)
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
        
        chekingTheory(text: textField.text)
        
        return true
    }
}
