//
//  NameQuizViewController.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 net.tksho. All rights reserved.
//

import UIKit

class NameQuizViewController: UIViewController {

    var numOfAnswer: Int = 0 // 正解数
    var indexOfQuiz: Int = 0 // 現在何問目か
    var quizArray: [Quiz] = []
    
    @IBOutlet var indexLabel: UILabel!
    @IBOutlet var descTextView: UITextView!
    @IBOutlet var option1: UIButton!
    @IBOutlet var option2: UIButton!
    @IBOutlet var option3: UIButton!
    @IBOutlet var option4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // クイズ初期化
        setUpQuiz()

        // クイズをランダムに並び替え
        //randSortQuiz()
        
        // 1問目を表示
        showQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 回答1（左上）が押された
    @IBAction func tapOption1() {
        indexOfQuiz += 1
        print("option1が押された")
        // 正解判定
        // 次の問題を表示
        showQuiz()
print("option1おわり")
    }
    
    // 回答2（右上）が押された
    @IBAction func tapOption2() {
        indexOfQuiz += 1
        print("option2が押された")
        // 正解判定
        // 次の問題を表示
        showQuiz()
    }
    
    // 回答3（左下）が押された
    @IBAction func tapOption3() {
        indexOfQuiz += 1
        print("option3が押された")
        // 正解判定
        // 次の問題を表示
        showQuiz()
    }

    // 回答4（右下）が押された
    @IBAction func tapOption4() {
        indexOfQuiz += 1
        print("option4が押された")
        // 正解判定
        // 次の問題を表示
        showQuiz()
    }

    // クイズの中身初期化
    func setUpQuiz(){
        let quiz01 = Quiz(text:"赤身の中に脂が粗い網状に入っています。コクがあり、濃厚な味で様々な豚肉料理に幅広く使われる部位です。", option1:" 肩ロース", option2:"ロース", option3:"ヒレ", option4:"ばら", answer:"肩ロース")
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

        // 全問解き終わったら終了
        if indexOfQuiz >= quizArray.count {
            let alert = UIAlertController(title: "全問終了！", message: "結果は3問中3問正解でした", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (okAction) in
                // OKボタン押したときのアクション
                alert.dismiss(animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            })
            // ボタン表示
            alert.addAction(okAction)
            // アラート表示
            self.present(alert, animated: true, completion: nil)            
        }
        else {
            // 次の問題表示
            indexLabel.text = String(indexOfQuiz+1) + "/20問目"
            descTextView.text = quizArray[indexOfQuiz].text
            option1.setTitle(quizArray[indexOfQuiz].option1, for: .normal)
            option2.setTitle(quizArray[indexOfQuiz].option2, for: .normal)
            option3.setTitle(quizArray[indexOfQuiz].option3, for: .normal)
            option4.setTitle(quizArray[indexOfQuiz].option4, for: .normal)
        }
    }
    
}
