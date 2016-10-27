//
//  ViewController.swift
//  MyQuiz
//
//  Created by 倉敷亮太 on 2016/10/27.
//  Copyright © 2016年 倉敷亮太. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 次の画面に遷移する前に呼び出される処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移画面取り出し
        if let nextViewController = segue.destination as? QuestionViewController {
            //問題文の取り出し
            if let questionData = QuestionDataManager.sharedInstance.nextQuestion() {
                // 問題文のセット
                nextViewController.questionData = questionData
            }
        }
        
    }
    
    //タイトルに戻ってくる時の処理{
    @IBAction func goToTitle(segue :UIStoryboardSegue){
    }


}

