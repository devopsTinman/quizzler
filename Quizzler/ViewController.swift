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
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionIndex : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
       
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionIndex = questionIndex + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIndex + 1)
//        let currentQuestion = allQuestions.list[questionIndex]
//        questionLabel.text = currentQuestion.questionText
        
    }
    

    func nextQuestion() {
      
        if questionIndex <= 12 {
            questionLabel.text = allQuestions.list[questionIndex].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "you've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }

    }
    
    
    func checkAnswer() {
        
        if pickedAnswer == allQuestions.list[questionIndex].answer {
            score += 1
        } else {
                print("wrong")
            }
        }
    
    
    func startOver() {
        score = 0
       questionIndex = 0
        nextQuestion()
    }
    

    
}
