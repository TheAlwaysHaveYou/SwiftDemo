//
//  BaseUIController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/11.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class BaseUIController: UIViewController {

//    var label : DemoLabel? 全局变量, 为初始化,  下面写代码的时候 好多问号
    
//    var label = DemoLabel()
    
    //初始化并且分配空间 , label 会提前创建
    //移动端开发 , '延迟加载' 减少内存消耗
    //懒加载 - lazy
    /*
     1.能够延迟创建
     2.最大的好处 -> 接触解包的烦恼
     */
//    lazy var label : DemoLabel = DemoLabel()
    
    //懒加载本质上是一个 '闭包'
    //完整写法如下:供参考,日常开发不建议这么写
    /*
     {} 包装代码
     () 执行代码
     
     日常开发:
        1.闭包中的智能提示不好
        2.闭包中如果出现 self. 还要注意循环引用
     */
    lazy var label = { ()->DemoLabel in
        let l = DemoLabel()
        
        //设置属性
        return l
    }()
    
    /*
     注意: 和OC不同
     一旦 label 被设置为nil , 懒加载也不会再次执行
     // 懒加载的代码只会在第一次调用的时候,执行闭包,然后将闭包的结果保存在label的属性中
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //在Swift中一定注意不要给主动清理视图或者空间
        //因为懒加载不会再次创建!!!
    }
}
