//
//  ViewController.swift
//  flashcards
//
//  Created by Jim Appiah on 3/10/22.
//

import UIKit

struct Flashcard{
    var question: [String]
    var answer: [String]
    
}
class ViewController: UIViewController {

    @IBOutlet weak var frontLabel:UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
  
    @IBOutlet weak var btnOptionthree: UIButton!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var card: UIView!
    
    //array to hold our flashcards
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do additional setup after loading the view typically from the nib
       
        // Do any additional setup after loading the view.
        backLabel.isHidden = true
        frontLabel.isHidden = false
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.8
        readSavedFlashcards()
        print(flashcards)
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the first element in the periodic table", answer: "Hydrogen", extraAnswer1: "Hydrogen", extraAnswer2: "Helium")
        } else { updateLabels()
            updateNextPrevButtons()
        }
        
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        showColor(color: .blue)
        }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        showColor(color: .red)
        
    }
    @IBAction func didTapOptionthree(_ sender: Any) {
        showColor(color: .red)
    }
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        
        updateNextPrevButtons()
    }
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    @IBAction func didTapOnFlashcard(_ sender: Any) {
//        frontLabel.isHidden = true;
//        backLabel.isHidden = false;
        frontLabel.isHidden.toggle()
        backLabel.isHidden.toggle()
    }
    func updateFlashcard(question:String, answer:String, extraAnswer1: String, extraAnswer2: String ) {
        let flashcard = Flashcard(question: [question], answer: [answer, extraAnswer1, extraAnswer2])
        frontLabel.text = flashcard.question[0]
        backLabel.text = flashcard.answer[0]
        
        //adding flashcards
        flashcards.append(flashcard)
        //logging to the console
        print("Added new flashcard")
        print("We now have\(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        updateNextPrevButtons()
    
        backLabel.text = answer
        frontLabel.text = question
        btnOptionOne.setTitle(extraAnswer1, for: .normal)
        btnOptionTwo.setTitle(extraAnswer2, for: .normal)
        updateNextPrevButtons()
        
        updateLabels()
        saveAllFlashcardstoDisk()
        
    
    
    }
    func showColor(color: UIColor) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.view.backgroundColor = color
        }, completion: { finished in
           print("another animation! - 1")
            self.view.backgroundColor = .white

        })
    
}
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false}
        else{
                nextButton.isEnabled = true
        }
        if currentIndex == 0{prevButton.isEnabled = false
            
        }else { prevButton.isEnabled = true}
    }
    func updateLabels(){
        
        let currentFlashcards = flashcards[currentIndex]
        frontLabel.text = currentFlashcards.question[0]
        backLabel.text = currentFlashcards.answer[0]
        btnOptionOne.setTitle(currentFlashcards.answer[0], for: .normal)
        btnOptionTwo.setTitle(currentFlashcards.answer[1], for: .normal)
        btnOptionthree.setTitle(currentFlashcards.answer[2], for: .normal)

    }
    func saveAllFlashcardstoDisk(){
        print("flashcards",flashcards[flashcards.count - 1])
//        flashcards = []
        let dictionaryArray = flashcards.map { (card) -> [String: [String]] in return ["question": card.question, "answer": card.answer]
            
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("Flashcards saved to UserDefaults")
    }
    func readSavedFlashcards(){
    if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: [String]]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
                
            }; flashcards.append(contentsOf:savedCards)
        }
       
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


