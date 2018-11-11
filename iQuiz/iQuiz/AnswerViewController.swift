//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Wynston Hsu on 11/3/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    var model = QuizModel.appData
    
    @IBOutlet weak var quizTitle: UINavigationItem!
    @IBOutlet weak var quizQuestion: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
//        swipeLeft.direction = .left
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeLeft)
//        self.view.addGestureRecognizer(swipeRight)
    }
    
//    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
//        model.questionIndex += 1
//        if (sender.direction == .left) {
//            if model.questionIndex == model.data[model.quizIndex].questions.count {
//                performSegue(withIdentifier: "finishedSegue", sender: self)
//            } else {
//                performSegue(withIdentifier: "questionSegue", sender: self)
//            }
//        } else if (sender.direction == .right) {
//            model.questionIndex = 0
//            model.countCorrect = 0
//            performSegue(withIdentifier: "backSegue", sender: self)
//        }
//    }
    
    private func loadData() {
        let currentQuiz = model.quizData[model.quizIndex]
        let currentQuestion = currentQuiz.questions![model.questionIndex]
        quizTitle.title = currentQuiz.title
        quizQuestion.text = currentQuestion.text
        let correctAnswer = currentQuestion.answers![Int(currentQuestion.answer!)! - 1]
        if model.choiceIndex == correctAnswer {
            result.text = "Correct! The right answer is"
            model.countCorrect += 1
        } else {
            result.text = "Uh oh! The right answer is"
        }
        questionAnswer.text = correctAnswer
    }

    @IBAction func nextQuestion(_ sender: Any) {
        model.questionIndex += 1
        if model.questionIndex == model.quizData[model.quizIndex].questions!.count {
            performSegue(withIdentifier: "finishedSegue", sender: self)
        }
        performSegue(withIdentifier: "questionSegue", sender: self)
    }
}
