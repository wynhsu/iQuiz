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
    
    struct Quiz {
        let title: String
        let descript: String
        let image: UIImage
        let questions: [String]
        let qImages: [UIImage]
        let choices: [[String]]
        let answers: [String]
    }

    open var data: [Quiz] = [
        Quiz(title: "PupQuiz", descript: "Think you're an expert on dogs? Take this quiz and find out!", image: #imageLiteral(resourceName: "dog"), questions: ["What kind of dog is this?", "What kind of dog is Scooby-Doo?"], qImages: [#imageLiteral(resourceName: "jindo"), #imageLiteral(resourceName: "scooby")], choices:[ ["Shiba Inu", "Pit Bull", "Jindo", "Akita"], ["Great Dane", "Rottweiler", "Dobermann", "German Shepherd"] ], answers: ["Jindo", "Great Dane"]),
        Quiz(title: "Around the World", descript: "From the Eiffel Tower to the Great Wall of China, match these famous locations with their country of origin!", image: #imageLiteral(resourceName: "globe"), questions: ["Located in the Eastern Cordillera of southern Peru, this iconic Inca citadel is often referred to as the 'Lost City'", "One of the largest religious monuments in the world, this Hindu turned Buddhist temple has become a symbol of Cambodia."], qImages: [#imageLiteral(resourceName: "machu"), #imageLiteral(resourceName: "angkor")], choices: [["Chichen Itza", "Machu Picchu", "Pompeii", "Atlantis"], ["Timbuktu", "Taj Mahal", "Moai", "Angkor Wat"]], answers: ["Machu Picchu", "Angkor Wat"]),
        Quiz(title: "TV & Movies", descript: "Test your knowledge on popular Movie and TV shows. (Hint: The Office isn't the only show to know)", image: #imageLiteral(resourceName: "movie"), questions: ["From the hit HBO series Game of Thrones, Daenerys Targaryen has been given many titles. Which of the following isn't one of them?", "Which of the following film title from The Bourne movie series did NOT star Matt Damon?"], qImages: [#imageLiteral(resourceName: "dani"), #imageLiteral(resourceName: "bourne")], choices: [["Mother of Dragons", "Breaker of Rules", "Mhysa", "The Unburnt"], ["Identity", "Supremacy", "Ultimatum", "Legacy"]], answers: ["Breaker of Rules", "Legacy"])
    ]
    
    open var quizIndex: Int = 0
    open var questionIndex: Int = 0
    open var choiceIndex: String = ""
    open var countCorrect: Int = 0
}
