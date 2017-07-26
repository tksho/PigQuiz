//
//  HighScoreViewController.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 net.tksho. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {

    var scores: Int = 0
    @IBOutlet var label: UILabel!
    @IBOutlet var label_parts: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var highScore: Int = 0
        var highScoreRank: String!

        let ud = UserDefaults.standard

        // 部位名クイズ
        highScore = ud.integer(forKey: "highScore")
        if ud.string(forKey: "highScoreRank") != nil {
            highScoreRank = ud.string(forKey: "highScoreRank")
            label.text = String(highScore) + "問正解（" + String(highScoreRank) + "ランク）"
        }
        else {
            label.text = "まだプレイしていません"
        }

        // 部位位置クイズ
        highScore = ud.integer(forKey: "highScore_parts")
        if ud.string(forKey: "highScoreRank_parts") != nil {
            highScoreRank = ud.string(forKey: "highScoreRank_parts")
            label_parts.text = String(highScore) + "問正解（" + String(highScoreRank) + "ランク）"
        }
        else {
            label_parts.text = "まだプレイしていません"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
