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
    var sizeClass: (UIUserInterfaceSizeClass, UIUserInterfaceSizeClass) {
        return (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setupQuestion()
    }
    
    @IBAction func answerButtonClicked(_ sender: UIButton) {
        check(answer: sender.tag  )
    }
    
    /*MARK: My approach*/
    func style() {
        switch sizeClass {
            // ipad
        case (.regular, .regular):
            titleSize(UIElement: scoreLbl, textSize: 30)
            // iphone landscape and portrait
        default:
            titleSize(UIElement: scoreLbl, textSize: 15)
        }
        
        [answer1Btn, answer2Btn, answer3Btn].forEach { button in
            switch sizeClass {
                // ipad
            case (.regular, .regular):
                titleSize(UIElement: button, textSize: 30)
                // iphone landscape and portrait
            default:
                titleSize(UIElement: button, textSize: 15)
            }
            
            button?.layer.cornerRadius = 6
        }
    }

    func titleSize<T>(UIElement: T, textSize: CGFloat){
        if let titleLabel = UIElement as? UILabel {
            titleLabel.font = UIFont.systemFont(ofSize: textSize, weight: .regular)
        } else if let titleBtn = UIElement as? UIButton {
            titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: textSize, weight: .semibold)
        }
    }
    
    /*MARK: Course Instructor's approach*/
//    func style() {
//        switch sizeClass {
//            //iphone landscape
//        case (.compact, .compact), (.regular, .compact):
//            scoreLbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//            //iphone portrait
//        case (.compact, .regular):
//            scoreLbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//            // ipad
//        case (.regular, .regular):
//            scoreLbl.font = UIFont.systemFont(ofSize: 30, weight: .regular)
//        default:
//            scoreLbl.font = UIFont.systemFont(ofSize: 15, weight: .regular)
//        }
//        
//        [answer1Btn, answer2Btn, answer3Btn].forEach { button in
//            switch sizeClass {
//                //iphone landscape
//            case (.compact, .compact), (.regular, .compact):
//                button?.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//                //iphone portrait
//            case (.compact, .regular):
//                button?.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//                // ipad
//            case (.regular, .regular):
//                button?.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
//            default:
//                button?.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
//            }
//            
//            button?.layer.cornerRadius = 6
//        }
//    }
    
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

