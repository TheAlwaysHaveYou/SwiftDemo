//
//  DemoLabel.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/11.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    //XIB  不会调用, 纯代码专用的
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    //initWithCoder -> 是使用 Xib/SB 开发的入口
    //提示:所有UIView 及子类在开发时, 一旦重写构造函数
    //必须要实现 initWithCoder 函数 以保证提供两个通道
    //方法的添加 Xcode有智能提示
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError : 如果用Xib 开发, 会直接崩溃
        //禁止 Xib/SB 使用本类
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Swift中的 getter 方法和 setter 方法,  演示, 日常开发中不用
    private var _name : String?
    
    var name : String? {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    //只读属性  readOnly
    //OC 中定义属性的时候,有一个 readOnly -> 重写 getter方法
    var title: String {
        //只重写 getter 方法, 没有重写 setter 方法
        //就是只读属性
        get {
            return "嘿嘿嘿" + (name ?? "")
        }
    }
    
    //只读属性的简写 - 直接 return
    //又称为 '计算型'属性 -> 本身不保存内容, 都是通过计算获得结果
    //类似于一个函数
    //  - 没有参数
    //  - 一定有返回值
    var title2 : String {
        return "哈哈哈" + (name ?? "")
    }
    
    // readOnly 对比 懒加载      readOnly 每次读取都是重新计算内容,  懒加载每次调用只会取第一次生成的结果
    
    /*
     懒加载的title3  , 本质是一个闭包
     懒加载会在第一次访问的时候,执行 , 闭包执行结束后会把结果保存在 title3中
     后续调用,直接返回 title3 的内容
     懒加载的属性会分配空间存储值
     */
    lazy var title3 : String = {
       return "lazy" + (name ?? "")
    }()
    
    
    
    //模型 -> 给视图设置模型, 由视图自己根据模型的数据,决定显示内容
    var person : Person? {
        //****** 就是代替 OC 中重写 setter 方法
        // 区别: 再也不用考虑  _person = person
        // OC中如果是 copy 属性, 应该 _成员变量 = 值.copy
        didSet {
            //此时 name属性已经有值 , 可以直接使用设置UI内容
            text = person?.name
        }
    }
    
}
