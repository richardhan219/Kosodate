//
//  QuizQuestion.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/20.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import Foundation
class Question {
    let questionnumber: Int
    let questionImage: String
    let question: String
    let questionInfo :String
    let optionA: String
    let optionB: String
    let correctAnswer: Int
    
    init(num:Int ,image: String, questionText: String,questionInfomation:String, choiceA: String, choiceB: String, answer: Int){
        questionnumber = num
        questionImage = image
        questionInfo = questionInfomation
        question = questionText
        optionA = choiceA
        optionB = choiceB
        correctAnswer = answer
    }
}
