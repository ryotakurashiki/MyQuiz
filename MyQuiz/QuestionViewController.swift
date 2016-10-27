//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by 倉敷亮太 on 2016/10/27.
//  Copyright © 2016年 倉敷亮太. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionData :QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageView: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    @IBAction func tapAnswer1Button(_ sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer2Button(_ sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer3Button(_ sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer4Button(_ sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goNextQuestionWithAnimation() {
        // 正解しているかの判定
        if questionData.isCorrect() {
            //正解のアニメーションを出しつつ次の問題へ
            goNextQuestionWithCorrectAnimation()
        } else {
            //不正解のアニメーションを出しつつ次の問題へ
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    func goNextQuestionWithCorrectAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
          self.correctImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion()
        }
    }
    
    func goNextQuestionWithIncorrectAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn, .curveEaseOut], animations: {
            self.incorrectImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion()
        }
    }
    
    func goNextQuestion() {
        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() {
            if let nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question")
            as? QuestionViewController {
                print("next q")
                nextQuestionViewController.questionData = nextQuestion
                self.present(nextQuestionViewController, animated: true, completion: nil)
            }
        } else {
            print("next page")
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result")
            as? ResultViewController {
                self.present(resultViewController, animated: true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
