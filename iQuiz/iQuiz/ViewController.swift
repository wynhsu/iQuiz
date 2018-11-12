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
    let storage = UserDefaults.standard
    var offline = false

    @IBOutlet weak var quizToolbar: UIToolbar!
    @IBOutlet weak var quizTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonURL = "http://tednewardsandbox.site44.com/questions.json"
        let url = storage.value(forKey: "jsonURL")
        if (url != nil) {
            fetchJSON(jsonURL: url as! String)
        } else {
            fetchJSON(jsonURL: jsonURL)
        }
        offline = checkOffline()
        quizTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if offline == true {
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.") }))
            self.present(alert, animated: true, completion: nil)
        } else {
            print("Internet connection OK")
        }
    }
    
    private func fetchJSON(jsonURL: String) {
        guard let url = URL(string: jsonURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                self.model.quizData = try JSONDecoder().decode([QuizModel.Category].self, from: data)
                self.storage.set(try? PropertyListEncoder().encode(self.model.quizData), forKey: "localData")
                DispatchQueue.main.async {
                    self.quizTableView.reloadData()
                }
            } catch let jsonErr {
                print("Error with JSON:", jsonErr)
            }
        }.resume()
    }
    
    private func checkOffline() -> Bool {
        if Reachability.isConnectedToNetwork() == true {
            return false
        } else {
            if let data = self.storage.value(forKey: "localData") as? Data {
                self.model.quizData = try! PropertyListDecoder().decode(Array<QuizModel.Category>.self, from: data)
            }
            return true
        }
    }
    
    @IBAction func onSettingsTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Enter URL", message: "Input your own quiz data with a custome URL", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter URL"
        }
        let checkNow = UIAlertAction(title: "Check Now", style: .default, handler: { (_) in
            let value = alert.textFields![0].text
            if (value != "") {
                self.storage.set(value, forKey: "jsonURL")
                self.fetchJSON(jsonURL: value!)
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alert.addAction(checkNow)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.quizIndex = indexPath.row
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

