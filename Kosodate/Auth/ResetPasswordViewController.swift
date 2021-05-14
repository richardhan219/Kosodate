
//  ResetPasswordViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/12/14.
//  Copyright © 2018 Richard Han. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "パスワードをリセット"
        emailTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetPassword(sender: UIButton) {
        
        // Validate the input
        guard let emailAddress = emailTextField.text,
            emailAddress != "" else {
                
                let alertController = UIAlertController(title: "エラー", message: "パスワードをリセットのため、メールアドレス入力してください", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                present(alertController, animated: true, completion: nil)
                
                return
        }
        
        // Send password reset email
        Auth.auth().sendPasswordReset(withEmail: emailAddress, completion: { (error) in
            
            let title = (error == nil) ? "パスワードをリセット" : "エラー"
            let message = (error == nil) ? "パスワードリセットのメールをお送りしました。受信トレイを確認し、指示に従ってパスワードをリセットしてください。" : error?.localizedDescription
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
                if error == nil {
                    
                    // Dismiss keyboard
                    self.view.endEditing(true)
                    
                    // Return to the login screen
                    if let navController = self.navigationController {
                        navController.popViewController(animated: true)
                    }
                }
            })
            alertController.addAction(okayAction)
            
            self.present(alertController, animated: true, completion: nil)
        })
        
    }
}
