//
//  Question.swift
//  Quizzler
//
//  Created by Md Zahidul Islam Mazumder on 16/2/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    var text:String
    let answer:Bool
    
    init(text:String,correctAnswer:Bool) {
        self.text = text
        answer = correctAnswer
    }
    
}
