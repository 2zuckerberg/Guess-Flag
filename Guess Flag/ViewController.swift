//
//  ViewController.swift
//  Guess Flag
//
//  Created by tozuckerberg on 16/9/5.
//  Copyright © 2016年 ZhangBinbin. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //设置边框宽度
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //设置边框颜色
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(nil)
    }
    
    func askQuestion(_ action:UIAlertAction!) {
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: UIControlState())
        button2.setImage(UIImage(named: countries[1]), for: UIControlState())
        button3.setImage(UIImage(named: countries[2]), for: UIControlState())
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else {
            title = "Wrong"
            score -= 1
        }
        
        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true, completion: nil)
    }
}

