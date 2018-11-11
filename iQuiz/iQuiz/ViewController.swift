//
//  ViewController.swift
//  iQuiz
//
//  Created by Wynston Hsu on 10/26/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var model = QuizModel.appData
//    var quizData: [QuizModel.Category] = []

    @IBOutlet weak var quizToolbar: UIToolbar!
    @IBOutlet weak var quizTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON()
        quizTableView.tableFooterView = UIView()
    }
    
    private func fetchJSON() {
        let jsonURL = "http://tednewardsandbox.site44.com/questions.json"
        guard let url = URL(string: jsonURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
//            let dataString = String(data: data, encoding: .utf8)
//            print(dataString)
//            self.storeJSON(data: data)
            do {
                self.model.quizData = try JSONDecoder().decode([QuizModel.Category].self, from: data)
                
//                self.model.quizData = UserDefaults.standard.object(forKey: "quizData") as! [QuizModel.Category]
//                try JSONSerialization.jsonObject(with: data) as! [QuizModel.Category]
                print(self.model.quizData)
                
                DispatchQueue.main.async {
                    self.quizTableView.reloadData()
                }
            } catch let jsonErr {
                print("Error with JSON:", jsonErr)
            }
            }.resume()
    }
    
    private func storeJSON(data: Data) {
        let storage = UserDefaults.standard
        storage.set(data, forKey: "quizData")
    }
    
    @IBAction func onSettingsTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Oops.", message: "Check back for settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.quizIndex = indexPath.row
        print(model.quizIndex)
//        tableView.deselectRow(at: indexPath, animated: true)
//        print(model.quizIndex)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(model.quizData.count)
        return model.quizData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cellTitle.text = model.quizData[indexPath.row].title
//        cell.cellImage.image = model.data[indexPath.row].image
        cell.cellDescript.text = model.quizData[indexPath.row].desc
        return cell
    }
}

