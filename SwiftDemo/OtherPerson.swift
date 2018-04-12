//
//  OtherPerson.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/4.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

/*
 1.在定义模型属性的时候, 如果是对象,  通常是可选的
        -在需要的时候常见
        -避免写构造函数,可以简化代码
 
 2.如果是基本数据(Int,Double等)类型, 不能设置可选的,而且要设置初始值, 否则  KVC 会崩溃
 
 3.如果需要使用KVC设置数值, 属性不能是private的
 
 4.在使用KVC方法之前,  应该调用super.init ,保证对象实例化完成
 */

class OtherPerson: NSObject {

    //延迟加载,  在需要的时候再创建
    var  name : String?
    
    
    //使用KVC会提示无法找到 age的 KEY   ,, 会崩溃
    //原因: Int是一个基本数据类型的结构体 , OC中没有, OC中只有基本数据类型   , 所以要赋值
//    var age : Int?
    var age : Int = 0
    
    //如果是 private私有属性 , 使用KVC设置值的时候, 同样无法设置
    //如果设置成 private 属性/方法 禁止外部访问,    (OC中通过运行时可以设置私有方法和属性!!!! ,,  Swift就不行了)
    private var title : String?
    
    //重载构造函数, 使用字典为本类设置初始值
    init(dic:[String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dic)
        
    }
    
    //重写父类方法,  (字典的属性比类的属性多的时候)
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //没有调用 super , 将父类的代码实现完全覆盖, 不会崩溃
    }
    
    
    //如果子类没有重写父类的方法, 调用的时候回直接调用父类的方法(子类有一个新的属性, 没有写init进行KVC解析,会调用父类的init KVC解析)
}
