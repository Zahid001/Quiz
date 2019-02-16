//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let question = QuestionBank()
    var questionNumber = 0
    var score = 0
    //var currentQuestion = []
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        
        checkAnswer(sender)
        updateUI()
        questionNumber = questionNumber+1
        nextQuestion()
    }
    
    
    func updateUI() {
      scoreLabel.text = String( score)
        progressLabel.text = "\(questionNumber+1)/13"
        progressBar.frame.size.width = (view.frame.size.width)/13 * CGFloat(questionNumber+1)
    }
    

    func nextQuestion() {
        if questionNumber < 13 {
            questionLabel.text = question.list[questionNumber].text
        }
        else{
            let alert = UIAlertController(title: "Warning", message: "Aquestions are finished", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            questionNumber = 0
            
        }
        
    }
    
    
    func checkAnswer(_ sender: AnyObject) {
        if sender.tag == 1{
            if question.list[questionNumber].answer {
                score = score+1
                ProgressHUD.showSuccess("Right")
            }
            else{
                ProgressHUD.showError("Wrong")
            }
        }
        if sender.tag == 2{
            if !question.list[questionNumber].answer {
                score = score+1
                ProgressHUD.showSuccess("Right")
            }
            else{
                ProgressHUD.showError("Wrong")
            }
        }
        
        
    }
    
    
    func startOver() {
       questionNumber=0
        score=0
        updateUI()
        nextQuestion()
    }
    

    
}
