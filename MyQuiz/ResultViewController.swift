//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by 倉敷亮太 on 2016/10/27.
//  Copyright © 2016年 倉敷亮太. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    
    let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
    var correctCount :Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        let correctPercent :Float = (Float(correctCount) / Float(questionCount)) * 100
        correctPercentLabel.text = String(format: "%.1f ", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
