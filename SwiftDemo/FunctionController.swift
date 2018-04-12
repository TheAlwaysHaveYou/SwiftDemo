//
//  FunctionController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/2.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class FunctionController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        print(sum(x: 12, y: 15))
    }

   
    func sum(x:Int , y:Int) -> Int {
        return x+y
    }
    //外部参数
    func sum1(num1 x:Int , num2 y:Int) -> Int {
        return x+y
    }
    //调用外部参数的时候直接忽略了参数名
    func sum2(_ x:Int , _ y:Int) -> Int {
        return x+y
    }
    //swift中 _ 下划线  就是忽略任何不感兴趣的内容
    
    //函数有默认值 , 调用的时候可以任意组合参数,  如果不指定,  就使用默认值
    func sum3(x:Int = 1 , y:Int = 2) -> Int {
        return x+y
    }
    
    
    //无返回值 ,,  主要用在闭包
    func demo1() {
        
    }
    func demo2() -> () {
        
    }
    func demo3() -> Void {
        
    }
    
    //闭包
    let b1 = { (x: Int) -> () in
        //带参数的闭包
        
    }
    
    let b2 = { (x: Int) -> Int in
        //带参数 返回值 的闭包
        
        return 1
    }
}
