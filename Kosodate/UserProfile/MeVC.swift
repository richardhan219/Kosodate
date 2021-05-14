//
//  MeVC.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/10/23.
//  Copyright © 2018 Richard Han. All rights reserved.


import UIKit
import Firebase
import SafariServices
import GoogleSignIn


class MeVC: UIViewController {
    var sectionTitile = ["お問い合わせ","このアプリについて"]
    var sectionContent = [["レビューで応援","アンケート"],["宇都宮大学都市計画研究室","開発者ページ","子育てしやすいまちづくり委員会"]]
    var links = ["https://plans.ishii.utsunomiya-u.ac.jp/","https://plans.ishii.utsunomiya-u.ac.jp/?page_id=63","https://plans.ishii.utsunomiya-u.ac.jp/kosodate/index.html"]

    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
  override func viewDidLoad() {
      super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "ログアウト", style: .destructive, handler: { (_) in
            
            do {
                if let providerData = Auth.auth().currentUser?.providerData {
                    let userInfo = providerData[0]
                    
                    switch userInfo.providerID {
                    case "google.com":
                        GIDSignIn.sharedInstance().signOut()
                        
                    default:
                        break
                    }
                }
                try Auth.auth().signOut()
                 // Present the welcome view
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeView") {
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    ProgressHUD.showSuccess("ログアウト完了")
                }
                
            } catch let signOutErr{
                 print("Failed to sign out:", signOutErr)
            }
            
            
        }))
        
        alertController.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
       
        
    }
}

extension MeVC: UITableViewDelegate, UITableViewDataSource {


    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? 2 : 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitile[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let urlString = "https://apps.apple.com/us/app/kosodate/id1437375850"
                if let url = URL(string: urlString){
                    UIApplication.shared.open(url)
                }
            }else{
                let urlString = "https://plans.ishii.utsunomiya-u.ac.jp/Tkosodate_slim/yuqihan/index.asp"
                if let url = URL(string: urlString){
                    UIApplication.shared.open(url)
                }
            }
        case 1:
            if let url = URL(string: links[indexPath.row]){
                let sfvc = SFSafariViewController(url:url)
                present(sfvc, animated: true ,completion: nil)
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
