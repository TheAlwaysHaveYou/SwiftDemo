//
//  UIExerciseController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/4.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class UIExerciseController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func setupUI() -> () {
        
        let firstText = UITextField(frame:CGRect(x: 10, y: 10, width: 50, height: 20))
        firstText.backgroundColor = UIColor.blue
        self.view.addSubview(firstText)
        
        let addLabel = UILabel(frame:CGRect(x: 20, y: 20, width: 40, height: 40))
        addLabel.font = UIFont.systemFont(ofSize: 14)
        addLabel.backgroundColor = UIColor.white
        self.view.addSubview(addLabel)
        
        let secondText = UITextField(frame:CGRect(x: 30, y: 30, width: 50, height: 20))
        secondText.backgroundColor = UIColor.blue
        self.view.addSubview(secondText)
        
        let finalLabel = UILabel(frame:CGRect(x: 50, y: 10, width: 40, height: 40))
        finalLabel.font = UIFont.systemFont(ofSize: 14)
        finalLabel.textColor = .black
        self.view.addSubview(finalLabel)
        
        let actionBtn = UIButton(frame:CGRect(x: 50, y: 50, width: 40, height: 40))
        actionBtn.addTarget(self, action:Selector(("action:")), for: .touchUpInside)
        actionBtn.setTitle("", for: .normal)
        self.view.addSubview(actionBtn)
    }
    
    func action(sender:UIButton) {
        
    }
}
