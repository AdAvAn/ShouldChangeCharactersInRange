//
//  ViewController.swift
//  ShouldChangeCharactersInRange
//
//  Created by Vlasiuk Dmitriy on 3/21/18.
//  Copyright © 2018 test.me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    var state: Dictionary<UITextField,Bool> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.becomeFirstResponder()
        
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.lightGray.cgColor
        loginButton.layer.cornerRadius = 5
        
        state = [email:false,password:false]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let pass:String = password.text ?? "Pass not entered"
        let allertMessage:String = "Password verification: (\(pass))"
        
        present(alert: "User logged in", message: allertMessage) { [unowned self] in
            self.state.forEach{$0.key.text = nil; self.state[$0.key] = false}
            self.email.becomeFirstResponder()
            self.loginButtonChangeState()
        }
    }
}


//MARK: Textfield Delegate
extension ViewController: UITextFieldDelegate {
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.lightGray
        return true
    }
    
    //func textFieldDidBeginEditing(_ textField: UITextField) { }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = nil
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.darkGray
        return true
    }
    
    //func textFieldDidEndEditing(_ textField: UITextField) { }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
        
            switch textField {
                case _ where textField.isIdentical(with: email) : state[textField] = chekMail(for: updatedText)
                case _ where textField.isIdentical(with: password) : state[textField] = chekPass(for: updatedText)
                default: break
            }
            
             loginButtonChangeState()
            
            print("shouldChangeCharactersIn: textField.text:\(text), replacementString: \(string)")
        }
        return true
    }

}

//MARK: Helpers
extension ViewController {
    
    /// Activates the login button
    private func loginButtonChangeState(){
        let failedFields = state.filter{!$0.value}
        loginButton.isEnabled = (failedFields.isEmpty) ? true : false
    }
    
    /// Verify that you have entered an email
    private func chekMail(for mail: String) -> Bool{
        return mail.isEmail
    }
    
    /// Verify that a password of the correct length is entered
    private func chekPass(for pass: String) -> Bool{
        return pass.passwordIsCorrect
    }

}
