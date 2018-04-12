//
//  UIButton+Extension.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/10.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

//便利构造函数来写扩招  extension相当于 OC中的category
extension UIButton {
    convenience init(frame: CGRect, title: String, font: CGFloat = 10) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: font)
    }
}


//let btn = UIButton(frame: , title: , font: )  创建
//let btn = UIButton(frame: , title: )    如果 参数有默认值 则可以忽略(font)
