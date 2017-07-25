//
//  Quiz.swift
//  pigQuiz
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 net.tksho. All rights reserved.
//

import UIKit

class Quiz: NSObject {
    var text: String!
    var option1: String!
    var option2: String!
    var option3: String!
    var answer: String!
    
    init(text: String, option1: String, option2: String, option3: String, answer: String) {
        self.text = text
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.answer = answer
    }
    
    
}
