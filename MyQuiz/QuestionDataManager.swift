//
//  QuestionDataManager.swift
//  MyQuiz
//
//  Created by 倉敷亮太 on 2016/10/27.
//  Copyright © 2016年 倉敷亮太. All rights reserved.
//

import Foundation

class QuestionData {
    var question: String?
    var answer1: String?
    var answer2: String?
    var answer3: String?
    var answer4: String?
    var correctAnswerNumber: Int
    
    var userChoiceAnswerNumber: Int?
    var questionNo: Int = 0
    
    init(questionSourceDataArray: [String]) {
        question = questionSourceDataArray[0]
        answer1 = questionSourceDataArray[1]
        answer2 = questionSourceDataArray[2]
        answer3 = questionSourceDataArray[3]
        answer4 = questionSourceDataArray[4]
        correctAnswerNumber = Int(questionSourceDataArray[5])!
    }
    
    func isCorrect() -> Bool {
        // 答えが一致しているか判定する
        if correctAnswerNumber == userChoiceAnswerNumber {
            //　正解
            return true
        }
        return false
    }
}

class QuestionDataManager {
    // シングルトンオブジェクト
     static let sharedInstance = QuestionDataManager()
    
    var questionDataArray = [QuestionData]()
    var nowQuestionIndex: Int = 0
    
    private init(){
    }
    
    func loadQuestion(){
        //格納済みの問題があれば一旦削除
        questionDataArray.removeAll()
        nowQuestionIndex = 0
        
        // CSVデータの読み込み
        let q1 = ["必殺技は何でしょう？","モッシュ","ダイブ","ヘドバン","ウォールオブデス","1"]
        let q2 = ["いきものがかりのデビュー曲は？","さくら","サクラ","桜","SAKURA","4"]
        let q3 = ["日本の最南端の島の名前は何でしょう？","与那国島","南鳥島","沖ノ鳥島","宗谷岬","3"]
        
        let qs = [q1, q2, q3]
        for q in qs{
            let questionData = QuestionData(questionSourceDataArray: q)
            self.questionDataArray.append(questionData)
            questionData.questionNo = self.questionDataArray.count
        }
    }
    //次の問題を取り出す
    func nextQuestion() -> QuestionData? {
        if nowQuestionIndex < questionDataArray.count {
            let nextQuestion = questionDataArray[nowQuestionIndex]
            nowQuestionIndex += 1
            return nextQuestion
        }
        return nil
    }
    
}
