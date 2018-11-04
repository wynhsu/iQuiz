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
    @IBOutlet weak var questionImg: UIImageView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var questionAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    private func loadData() {
        let currentQuiz = model.data[model.quizIndex]
        quizTitle.title = currentQuiz.title
        quizQuestion.text = currentQuiz.questions[model.questionIndex]
        questionImg.image = currentQuiz.qImages[model.questionIndex]
        if model.choiceIndex == currentQuiz.answers[model.questionIndex] {
            result.text = "Correct! The right answer is"
            model.countCorrect += 1
        } else {
            result.text = "Uh oh! The right answer is"
        }
        questionAnswer.text = currentQuiz.answers[model.questionIndex]
    }

    @IBAction func nextQuestion(_ sender: Any) {
        model.questionIndex += 1
        if model.questionIndex == model.data[model.quizIndex].questions.count {
            performSegue(withIdentifier: "finishedSegue", sender: self)
        }
        performSegue(withIdentifier: "questionSegue", sender: self)
    }
}
