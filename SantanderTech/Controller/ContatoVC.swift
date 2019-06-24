//
//  ContatoVC.swift
//  SantanderTech
//
//  Created by Elizeu RS on 23/06/19.
//  Copyright © 2019 elizeurs. All rights reserved.
//

import Foundation
import UIKit
import SwiftValidator

class ContatoVC: UIViewController, ValidationDelegate, UITextFieldDelegate {
  
//  TextFields
  @IBOutlet var fullNameTextField: UITextField!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var phoneNumberTextField: UITextField!
  
//  Error Labels
  @IBOutlet var fullNameErrorLabel: UILabel!
  @IBOutlet var emailErrorLabel: UILabel!
  @IBOutlet var phoneNumberErrorLabel: UILabel!
  
  
  @IBOutlet var cadastrarEmailBtn: UIButton!
  
  let validator = Validator()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.hideKeyboard)))
    
    validator.styleTransformers(success:{ (validationRule) -> Void in
      print("here")
      // clear error label
      validationRule.errorLabel?.isHidden = true
      validationRule.errorLabel?.text = ""
      
      if let textField = validationRule.field as? UITextField {
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 0.5
      } else if let textField = validationRule.field as? UITextView {
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 0.5
      }
    }, error:{ (validationError) -> Void in
      print("error")
      validationError.errorLabel?.isHidden = false
      validationError.errorLabel?.text = validationError.errorMessage
      if let textField = validationError.field as? UITextField {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
      } else if let textField = validationError.field as? UITextView {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
      }
    })
    
    
    validator.registerField(fullNameTextField, errorLabel: fullNameErrorLabel , rules: [RequiredRule(), FullNameRule()])
    validator.registerField(emailTextField, errorLabel: emailErrorLabel, rules: [RequiredRule(), EmailRule()])
    validator.registerField(phoneNumberTextField, errorLabel: phoneNumberErrorLabel, rules: [RequiredRule(), MinLengthRule(length: 9)])
    
  }
  
  @IBAction func submitTapped(_ sender: AnyObject) {
    print("Validating...")
    validator.validate(self)
  }
  
  // MARK: ValidationDelegate Methods
  
  func validationSuccessful() {
    print("Validation Success!")
    let alert = UIAlertController(title: "Success", message: "You are validated!", preferredStyle: UIAlertController.Style.alert)
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(defaultAction)
    self.present(alert, animated: true, completion: nil)
    
  }
  func validationFailed(_ errors:[(Validatable, ValidationError)]) {
    print("Validation FAILED!")
  }
  
  @objc func hideKeyboard(){
    self.view.endEditing(true)
  }
  
  // MARK: Validate single field
  // Don't forget to use UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    validator.validateField(textField){ error in
      if error == nil {
        // Field validation was successful
      } else {
        // Validation error occurred
      }
    }
    return true
  }
  
  @IBAction func cadastrarEmailAction(_ sender: Any)
  {
    
    if cadastrarEmailBtn.currentBackgroundImage == UIImage(named: "btnClicked")
    {
      cadastrarEmailBtn.setBackgroundImage(#imageLiteral(resourceName: "Rectangle "), for: .normal)
    }
    else
    {
      cadastrarEmailBtn.setBackgroundImage(#imageLiteral(resourceName: "btnClicked"), for: .normal)
    }
  }
  
  
}
