//
//  ViewController.swift
//  iQuiz
//
//  Created by Wynston Hsu on 10/26/18.
//  Copyright © 2018 Wynston Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var quizToolbar: UIToolbar!
    @IBOutlet weak var quizTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        quizTableView.translatesAutoresizingMaskIntoConstraints = false
        quizTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onSettingsTap(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Oops.", message: "Check back for settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    let topics = [ "PupQuiz", "Around the World", "TV & Movies" ]
    let images = [ #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "globe"), #imageLiteral(resourceName: "movie") ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cellImage.image = images[indexPath.row]
        cell.cellLabel.text = topics[indexPath.row]
        return cell
    }
}

