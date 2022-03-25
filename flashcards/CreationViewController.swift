//
//  CreationViewController.swift
//  flashcards
//
//  Created by Jim Appiah on 3/24/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var extraAnswer3: UITextField!
    @IBOutlet weak var extraAnswer2: UITextField!
    @IBOutlet weak var extraAnswer1: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTApOnCancel(_ sender: Any) {
        dismiss(animated: true)
        
    }
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let extraAnswer1 = extraAnswer1.text
        let extraAnswer2 = extraAnswer2.text
        let extraAnswer3 = extraAnswer3.text
        // show error
        
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty
        {let alert = UIAlertController(title: "Missing Text", message: "You cannot leave this empty", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "OK", style:.default)
            alert.addAction(okAction)
        
            present(alert, animated: true)} else {
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!,extraAnswer1:extraAnswer1!, extraAnswer2: extraAnswer2!,extraAnswer3:extraAnswer3!)
        
       
                dismiss(animated: true)}
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
