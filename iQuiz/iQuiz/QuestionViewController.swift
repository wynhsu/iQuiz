//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Wynston Hsu on 11/3/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var model = QuizModel.appData

    @IBOutlet weak var quizTitle: UINavigationItem!
    @IBOutlet weak var quizQuestion: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    
    var choiceSelected: String! = ""
    let defaultColor = UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
            self.loadData()
        })

//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
//        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture))
//        swipeLeft.direction = .left
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeLeft)
//        self.view.addGestureRecognizer(swipeRight)
    }
    
//    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
//        if (sender.direction == .left && choiceSelected != "") {
//            model.choiceIndex = choiceSelected
//            performSegue(withIdentifier: "answerSegue", sender: self)
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
        choiceOne.setTitle(currentQuestion.answers![0], for: .normal)
        choiceOne.layer.borderColor = defaultColor
        choiceTwo.setTitle(currentQuestion.answers![1], for: .normal)
        choiceTwo.layer.borderColor = defaultColor
        choiceThree.setTitle(currentQuestion.answers![2], for: .normal)
        choiceThree.layer.borderColor = defaultColor
        choiceFour.setTitle(currentQuestion.answers![3], for: .normal)
        choiceFour.layer.borderColor = defaultColor
    }
    
    private func btnStyleReset() {
        choiceOne.layer.backgroundColor = UIColor.white.cgColor
        choiceOne.setTitleColor(UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0), for: .normal)
        choiceTwo.layer.backgroundColor = UIColor.white.cgColor
        choiceTwo.setTitleColor(UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0), for: .normal)
        choiceThree.layer.backgroundColor = UIColor.white.cgColor
        choiceThree.setTitleColor(UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0), for: .normal)
        choiceFour.layer.backgroundColor = UIColor.white.cgColor
        choiceFour.setTitleColor(UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0), for: .normal)
    }
    
    @IBAction func btnChoice(_ sender: UIButton) {
        choiceSelected = sender.title(for: .normal)
        btnStyleReset()
        sender.layer.backgroundColor = defaultColor
        sender.setTitleColor(UIColor.white, for: .normal)
        print(choiceSelected)
    }
    
    @IBAction func submitChoice(_ sender: Any) {
        if choiceSelected == "" {
            let alert = UIAlertController(title: "Oops.", message: "Please select an answer before submitting.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            model.choiceIndex = choiceSelected
            performSegue(withIdentifier: "answerSegue", sender: self)
        }
    }
}
