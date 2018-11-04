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

    @IBOutlet weak var quizToolbar: UIToolbar!
    @IBOutlet weak var quizTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizTableView.tableFooterView = UIView()
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
        tableView.deselectRow(at: indexPath, animated: true)
        print(model.quizIndex)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cellTitle.text = model.data[indexPath.row].title
        cell.cellImage.image = model.data[indexPath.row].image
        cell.cellDescript.text = model.data[indexPath.row].descript
        return cell
    }
}

