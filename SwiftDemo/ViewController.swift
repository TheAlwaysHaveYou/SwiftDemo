//
//  ViewController.swift
//  SwiftDemo
//
//  Created by fan on 2018/3/29.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        FIXME: somthing
        
        //TODO: lalalal
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.frame = CGRect();
        view.backgroundColor = UIColor.black
        
        self.view.addSubview(view)
        
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.setTitle("", for: UIControlState(rawValue:0))
        print(btn)
        
        
        let x: Int? = 10
        let str : String? = ""
        
        print(x ?? 0)
        
        let newStr = "\(x ?? 0) \(str ?? "")"
        
        
        var array = [1,2,3,4,5,6]

        array.remove(at: 2)
        
        
        var newArr = [Int]()//初始化数组
        
        //[KEY: VALUE] -> [String : NSObject]
        let dic = ["name":"","age":""]
        //字典数组
        let dicArr:[[String : AnyObject]] = [["q":"qwe" as AnyObject,"s":"qwe" as AnyObject],
                                             ["a":"qwe" as AnyObject,"x":"wer" as AnyObject]]
        
        for (key,value) in dic {
            print("\(key)   \(value)")
        }
        
        for c in array {
            print(c)
        }
        
        
        
        for (a,b) in array.enumerated() {
            print("\(a)\(b)")
        }
        
//        for i in 0..<10 {//正序输出循环
//
//        }
//
//
//        for i in (0...9).reversed() {//倒序输出循环
//
//        }
        
//        self.btnClick(btn)
        
    }

    @objc func btnClick(sender : UIButton) -> () {
        print(#function)
    }

    
    func demo4() {
        
    }
    
}

