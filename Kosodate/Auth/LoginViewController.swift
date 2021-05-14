//
//  LoginViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/12/14.
//  Copyright © 2018 Richard Han. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "ログイン"
        emailTextField.becomeFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = ""
    }
      @IBAction func login(sender: UIButton) {
        
        //Validate the input
        guard let emailAddress = emailTextField.text, emailAddress != "",
        let password = passwordTextField.text, password != "" else {
            
            let alertController = UIAlertController(title:"ログインエラー", message: "メールアドレスとパスワードを入力してください。", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
            Auth.auth().signIn(withEmail: emailAddress, password: password, completion: { (result, error) in
                if error != nil{
                    let alertController = UIAlertController(title: "ログインエラー", message: "無効なパスワードまたはパスワードが間違っています。", preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true,completion: nil)
                    
                    return
                }
          // Email verification
            guard let result = result, result.user.isEmailVerified else {
                let alertController = UIAlertController(title: "ログインエラー", message: "まだあなたのメールアドレスでの登録は完了していません。作成した時に確認メールをお送りしました。そのメールの確認URLをクリックして登録完了してください。確認メールを再度送信する必要がある場合は『確認メール再送信』をタップしてください。", preferredStyle: .alert)
                
                let okayAction = UIAlertAction(title: "確認メール再送信", style: .default, handler: { (action) in
                    
                    Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                })
                let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                return
        }
            // Dismiss keyboard
            self.view.endEditing(true)
            
            
            
            // Present the main view
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                
            }
        })
    }
}
