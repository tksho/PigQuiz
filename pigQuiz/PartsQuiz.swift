//
//  PartsQuiz.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 net.tksho. All rights reserved.
//

import UIKit

class PartsQuiz: NSObject {
    var text: String!
    var answer: String!
    
    // 初期化
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }

}
