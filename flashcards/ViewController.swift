//
//  ViewController.swift
//  flashcards
//
//  Created by Jim Appiah on 3/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel:UILabel!
    @IBOutlet weak var backLabel: UILabel!
 
    @IBOutlet weak var card: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backLabel.isHidden = true
        frontLabel.isHidden = false
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.8
        
    }
    @IBAction func didTapOnFlashcard(_ sender: Any) {
//        frontLabel.isHidden = true;
//        backLabel.isHidden = false;
        frontLabel.isHidden.toggle()
        backLabel.isHidden.toggle()
        
    }
   
}

