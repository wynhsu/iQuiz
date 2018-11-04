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
    @IBOutlet weak var questionImg: UIImageView!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceFour: UIButton!
    
    var choiceSelected: String! = ""
    let defaultColor = UIColor(red: 0.0, green: 122.0/255, blue: 1.0, alpha: 1.0).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
        print(model.quizIndex)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.loadData()
        })
        //        loadData()
    }
    
    private func loadData() {
        let currentQuiz = model.data[model.quizIndex]
        let currentQuestion = model.questionIndex
        quizTitle.title = currentQuiz.title
        quizQuestion.text = currentQuiz.questions[currentQuestion]
        questionImg.image = currentQuiz.qImages[currentQuestion]
        choiceOne.setTitle(currentQuiz.choices[currentQuestion][0], for: .normal)
        choiceOne.layer.borderColor = defaultColor
        choiceTwo.setTitle(currentQuiz.choices[currentQuestion][1], for: .normal)
        choiceTwo.layer.borderColor = defaultColor
        choiceThree.setTitle(currentQuiz.choices[currentQuestion][2], for: .normal)
        choiceThree.layer.borderColor = defaultColor
        choiceFour.setTitle(currentQuiz.choices[currentQuestion][3], for: .normal)
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
