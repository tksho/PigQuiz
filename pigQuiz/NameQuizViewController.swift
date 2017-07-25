//
//  NameQuizViewController.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 net.tksho. All rights reserved.
//

import UIKit

class NameQuizViewController: UIViewController {

    var timer: Timer!
    var numOfAnswer: Int = 0 // 正解数
    var indexOfQuiz: Int = 0 // 現在何問目か
    var quizArray: [Quiz] = []
    
    @IBOutlet var indexLabel: UILabel!
    @IBOutlet var descTextView: UITextView!
    @IBOutlet var option1: UIButton!
    @IBOutlet var option2: UIButton!
    @IBOutlet var option3: UIButton!
    @IBOutlet var option4: UIButton!
    @IBOutlet var maru1: UIImageView!
    @IBOutlet var maru2: UIImageView!
    @IBOutlet var maru3: UIImageView!
    @IBOutlet var maru4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // クイズ初期化
        setUpQuiz()

        // 1問目を表示
        showQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 回答1（左上）が押された
    @IBAction func tapOption1() {
        self.checkAnswer(optionNo: 1)
        
        indexOfQuiz += 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NameQuizViewController.showQuiz), userInfo: nil, repeats: false)
    }
    
    // 回答2（右上）が押された
    @IBAction func tapOption2() {
        self.checkAnswer(optionNo: 2)
        
        indexOfQuiz += 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NameQuizViewController.showQuiz), userInfo: nil, repeats: false)
    }
    
    // 回答3（左下）が押された
    @IBAction func tapOption3() {
        self.checkAnswer(optionNo: 3)
        
        indexOfQuiz += 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NameQuizViewController.showQuiz), userInfo: nil, repeats: false)
    }

    // 回答4（右下）が押された
    @IBAction func tapOption4() {
        self.checkAnswer(optionNo: 4)
        
        indexOfQuiz += 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(NameQuizViewController.showQuiz), userInfo: nil, repeats: false)
    }

    // クイズ初期化
    func setUpQuiz(){
        let quiz01 = Quiz(text:"赤身の中に脂が粗い網状に入っています。コクがあり、濃厚な味で様々な豚肉料理に幅広く使われる部位です。", option1:"肩ロース", option2:"ロース", option3:"ヒレ", option4:"ばら", answer:"肩ロース")
        let quiz02 = Quiz(text:"キメ細で、肉質も柔らかく一番美味しい部位。ふちの脂身部分にも旨みがあります。豚カツや、ロースハムなどが代表的な料理。", option1:"ロース", option2:"肩スペアリブ", option3:"肩ロース", option4:"カシラニク", answer:"ロース")
        let quiz03 = Quiz(text:"ロースと並び豚肉の中で一番良質の部位。ビタミンB1が最も多く含まれてまた、脂分が少ないのに柔らかいのも特徴的。", option1:"ヒレ", option2:"ばら", option3:"もも", option4:"ガツ", answer:"ヒレ")
        let quiz04 = Quiz(text:"濃厚な脂身が特徴の部位。別名を三枚肉。ベーコン・お好み焼き・角煮などが代表的料理。骨付きは、スペアリブと呼ばれます。", option1:"もも", option2:"ばら", option3:"肩ロース", option4:"ハツ", answer:"ばら")
        let quiz05 = Quiz(text:"脂肪分が少く、さっぱりと食べられる部位。キメ細で、ヒレに次いでビタミンB1が豊富。プロシュートなどの生ハムに使われます。", option1:"ガツ", option2:"肩スペアリブ", option3:"もも", option4:"ばら", answer:"もも")

        self.quizArray.append(quiz01)
        self.quizArray.append(quiz02)
        self.quizArray.append(quiz03)
        self.quizArray.append(quiz04)
        self.quizArray.append(quiz05)
    }
    
    func showQuiz() {
        // 全問解き終わったらクイズ終了
        if indexOfQuiz >= quizArray.count {

            // ランクを算出
            var rank: String!
            if numOfAnswer < 2 {
                rank = "無知"
            }
            else if numOfAnswer < 4 {
                rank = "あと少しでマスター"
            }
            else {
                rank = "マスター"
            }
            
            // 正解数をアラートで表示
            let message = "結果は" + String(quizArray.count) + "問中" + String(numOfAnswer) + "問正解でした。あなたは「" + String(rank) + "」クラスです！"
            let alert = UIAlertController(title: "全問終了！", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (okAction) in
                // OKボタン押したときのアクション
                alert.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okAction) // OKボタン設置
            self.present(alert, animated: true, completion: nil) // アラート表示
        }
        else {
            // 次の問題を表示
            indexLabel.text = String(indexOfQuiz+1) + "/" + String(quizArray.count) + "問目"
            descTextView.text = quizArray[indexOfQuiz].text
            option1.setTitle(quizArray[indexOfQuiz].option1, for: .normal)
            option2.setTitle(quizArray[indexOfQuiz].option2, for: .normal)
            option3.setTitle(quizArray[indexOfQuiz].option3, for: .normal)
            option4.setTitle(quizArray[indexOfQuiz].option4, for: .normal)
            maru1.image = UIImage(named: "")
            maru2.image = UIImage(named: "")
            maru3.image = UIImage(named: "")
            maru4.image = UIImage(named: "")

        }
    }

    // 正解判定と○×マークつける
    func checkAnswer(optionNo: Int){
        // 正解判定し、間違ってれば×マーク表示
        if optionNo == 1 {
            if quizArray[indexOfQuiz].option1 == quizArray[indexOfQuiz].answer {
                numOfAnswer += 1
            }
            else {
                maru1.image = UIImage(named: "incorrect.png")
            }
        }
        else if optionNo == 2 {
            if quizArray[indexOfQuiz].option2 == quizArray[indexOfQuiz].answer {
                numOfAnswer += 1
            }
            else {
                maru2.image = UIImage(named: "incorrect.png")
            }
        }
        else if optionNo == 3 {
            if quizArray[indexOfQuiz].option3 == quizArray[indexOfQuiz].answer {
                numOfAnswer += 1
            }
            else {
                maru3.image = UIImage(named: "incorrect.png")
            }
        }
        else {
            if quizArray[indexOfQuiz].option4 == quizArray[indexOfQuiz].answer {
                numOfAnswer += 1
            }
            else {
                maru4.image = UIImage(named: "incorrect.png")
            }
        }
        
        // 正解選択肢に○マーク表示
        if quizArray[indexOfQuiz].option1 == quizArray[indexOfQuiz].answer {
            maru1.image = UIImage(named: "correct.png")
        }
        else if quizArray[indexOfQuiz].option2 == quizArray[indexOfQuiz].answer {
            maru2.image = UIImage(named: "correct.png")
        }
        else if quizArray[indexOfQuiz].option3 == quizArray[indexOfQuiz].answer {
            maru3.image = UIImage(named: "correct.png")
        }
        else {
            maru4.image = UIImage(named: "correct.png")
        }
        
    }
}
