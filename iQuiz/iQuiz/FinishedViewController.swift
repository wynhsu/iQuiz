//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Wynston Hsu on 11/4/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {

    var model = QuizModel.appData
    
    @IBOutlet weak var quizTitle: UINavigationItem!
    @IBOutlet weak var numberCorrect: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizTitle.title = model.quizData[model.quizIndex].title
        let correct = String(model.countCorrect)
        let total = String(model.quizData[model.quizIndex].questions!.count)
        numberCorrect.text =  "\(correct) out of \(total) correct"
        numberCorrect.textColor = UIColor(red: 1.0, green: 24.0/255, blue: 85.0/255, alpha: 1.0)
    }

    @IBAction func resetData(_ sender: Any) {
        model.questionIndex = 0
        model.countCorrect = 0
    }
}
