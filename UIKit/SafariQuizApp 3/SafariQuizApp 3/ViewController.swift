//
//  ViewController.swift
//  SafariQuizApp 3
//
//  Created by Zeeshan Waheed on 21/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionImgView: UIImageView!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    let questions: [QuestionModel] = [
        QuestionModel(image: UIImage(named: "lion")!, correctAnswer: 2, answer1: "Hippo", answer2: "Lion", answer3: "Antelope"),
        QuestionModel(image: UIImage(named: "giraffe")!, correctAnswer: 1, answer1: "Giraffe", answer2: "Crocodile", answer3: "Elephant"),
        QuestionModel(image: UIImage(named: "buffalo")!, correctAnswer: 3, answer1: "Hippo", answer2: "Lion", answer3: "Buffalo")
    ]
    var score = 0
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        check(answer: sender.tag  )
    }
    
    func check(answer: Int) {
        let currentQuestion = questions[currentQuestionIndex]
        var alertTitle = ""
        var alertMessage = ""
        if currentQuestion.correctAnswer == answer {
            print("Answer is correct")
            alertTitle = "Correct!"
            alertMessage = "You got the correct answer!"
            score += 1
            scoreLbl.text = "Score: \(score)"
        } else {
            print("Answer is incorrect")
            alertTitle = "Incorrect!"
            alertMessage = "You got the wrong answer!"
        }
        
        if currentQuestionIndex == questions.count - 1 {
            alertTitle = "End of Quiz"
            alertMessage = "Your final score is \(score) / \(questions.count)"
        }
        
        showAlert(title: alertTitle, message: alertMessage)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.nextQuestion()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    func nextQuestion() {
        currentQuestionIndex += 1
        guard currentQuestionIndex <= questions.count - 1 else {
            print("we have reached the end of the quiz")
            currentQuestionIndex = 0
            score = 0
            scoreLbl.text = "Score \(score)"
            setupQuestion()
            return
        }
        setupQuestion()
    }

    func setupQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionImgView.image = currentQuestion.image
        answer1Btn.setTitle(currentQuestion.answer1, for: .normal)
        answer2Btn.setTitle(currentQuestion.answer2, for: .normal)
        answer3Btn.setTitle(currentQuestion.answer3, for: .normal)
    }
}

