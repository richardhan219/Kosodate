//
//  RateController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/22.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit

class RateController: UIViewController {
    @IBOutlet var rateButtons: [UIButton]!
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBAction func tapBackGround(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startPosiion = CGAffineTransform(translationX: 500, y: 0)
        
        _ = CGAffineTransform(scaleX: 10, y: 10)
        
        
        
        for button in rateButtons{
            button.alpha = 0
            button.transform = startPosiion
        }

//        stackView.transform = .init(translationX: 800, y:0)
//        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn)
//        {
//            self.stackView.transform = .identity
//        }
//        animator.startAnimation()
        UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5) {
            self.rateButtons[0].alpha = 1
            self.rateButtons[0].transform = .identity
            }.startAnimation(afterDelay:0.1)
        UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5) {
            self.rateButtons[1].alpha = 1
            self.rateButtons[1].transform = .identity
            }.startAnimation(afterDelay:0.2)
        UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5) {
                self.rateButtons[2].alpha = 1
                self.rateButtons[2].transform = .identity
                }.startAnimation(afterDelay:0.3)
        UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5) {
                    self.rateButtons[3].alpha = 1
                    self.rateButtons[3].transform = .identity
                    }.startAnimation(afterDelay:0.4)
        UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5) {
            self.rateButtons[4].alpha = 1
            self.rateButtons[4].transform = .identity
            }.startAnimation(afterDelay:0.5)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
