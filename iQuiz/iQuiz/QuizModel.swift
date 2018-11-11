//
//  QuizModel.swift
//  iQuiz
//
//  Created by Wynston Hsu on 11/3/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import Foundation
import UIKit

class QuizModel: NSObject {
    static let appData = QuizModel()
    
    public struct Category: Decodable {
        let title: String?
        let desc: String?
        let questions: [Question]?

    }
    
    public struct Question: Decodable {
        let text: String?
        let answer: String?
        let answers: [String]?
    }
    
    open var quizIndex: Int = 0
    open var questionIndex: Int = 0
    open var choiceIndex: String = ""
    open var countCorrect: Int = 0
    open var quizData: [QuizModel.Category] = []

}
