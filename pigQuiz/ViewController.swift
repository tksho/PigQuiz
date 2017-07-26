//
//  ViewController.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 net.tksho. All rights reserved.
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

    // 部位名クイズボタンが押された
    @IBAction func tapNameQuizBtn() {
        self.performSegue(withIdentifier: "toNameQuiz", sender: nil)
    }

    // 部位位置クイズボタンが押された
    @IBAction func tapPartsQuizBtn() {
        self.performSegue(withIdentifier: "toPartsQuiz", sender: nil)
    }

    // ハイスコアボタンが押された
    @IBAction func tapHighScoreBtn() {
        self.performSegue(withIdentifier: "toHighScore", sender: nil)
    }

}

