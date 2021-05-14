//
//  QuizViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/20.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit
import Firebase

class QuizViewController: UIViewController {
//    @IBOutlet weak var questionCounter: UILabel!
//    @IBOutlet weak var scoreLabel: UILabel!
//    @IBOutlet weak var progressView: UIView!
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var questionLabel: UILabel!
//
//
//    //outlet for Buttons
//    @IBOutlet weak var optionA: UIButton!
//    @IBOutlet weak var optionB: UIButton!
//    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
        // Do any additional =setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let userPostRef = Database.database().reference().child("Quiz").child(uid)
            let email = Auth.auth().currentUser?.email
            let ref = userPostRef.childByAutoId()
            let values = ["Answer":sender.tag,"QuestionNumber":questionNumber+1,"CorrectAnswer":selectedAnswer,"email":email as Any] as [String : Any]
            ref.updateChildValues(values) { (err, ref) in
                if let err = err {
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                    print("Failed to save answer to DB", err)
                    return
                }
                
                print("Successfully saved answer to DB")
            }
            print("correct")
            let alertController = UIAlertController(title:"正解", message: allQuestions.list[questionNumber].questionInfo, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "次へ", style: .cancel, handler: { action in
                //run your function here
                self.updateQuestion()
            }))
            present(alertController, animated: true, completion: nil)
            score += 1
        }else{
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let userPostRef = Database.database().reference().child("Quiz").child(uid)
            let email = Auth.auth().currentUser?.email
            let ref = userPostRef.childByAutoId()
            let values = ["Answer":sender.tag,"QuestionNumber":questionNumber+1,"CorrectAnswer":selectedAnswer,"email":email as Any] as [String : Any]
            ref.updateChildValues(values) { (err, ref) in
                if let err = err {
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                    print("Failed to save answer to DB", err)
                    return
                }
                
                print("Successfully saved answer to DB")

            }
            print("Wrong")
            let alertController = UIAlertController(title:"残念", message: allQuestions.list[questionNumber].questionInfo, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "次へ", style: .cancel, handler: { action in
                //run your function here
                self.updateQuestion()
            }))
            present(alertController, animated: true, completion: nil)
            
            
    }
        questionNumber += 1
        
    }
    
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 1{
            imageView.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
         
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            updateUI()
        }else {
            let email = Auth.auth().currentUser?.email
            let sentquiz : [String:Any] = ["Score":score,"email":email as Any]
            Database.database().reference().child("Quizscore").childByAutoId().setValue(sentquiz)
            restartQuiz()
        }
        
        
    }
    
    func updateUI(){
        scoreLabel.text = "得点: \(score)"
        questionCounter.text = "\(questionNumber + 1 )/\(allQuestions.list.count - 1)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        ProgressHUD.showError("もう一回")
        
    }
    
    
    
}

