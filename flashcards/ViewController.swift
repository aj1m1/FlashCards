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
    
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
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
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = false
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        btnOptionTwo.isHidden = false
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = false
    }
    @IBAction func didTapOnFlashcard(_ sender: Any) {
//        frontLabel.isHidden = true;
//        backLabel.isHidden = false;
        frontLabel.isHidden.toggle()
        backLabel.isHidden.toggle()
    }
    func updateFlashcard(question:String, answer:String, extraAnswer1: String, extraAnswer2: String,extraAnswer3:String ) {
        
        backLabel.text = answer
        frontLabel.text = question
        btnOptionOne.setTitle(extraAnswer1, for: .normal)
        btnOptionTwo.setTitle(extraAnswer2, for: .normal)
        btnOptionThree.setTitle(extraAnswer3, for: .normal)
    
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let navigationController = segue.destination as! UINavigationController
    
    let creationController = navigationController.topViewController as! CreationViewController
    creationController.flashcardsController = self
      
       if segue.identifier == "EditSegue"{
           creationController.questionTextField.text = frontLabel.text
           creationController.answerTextField.text = backLabel.text
           
       }

}
   
}
