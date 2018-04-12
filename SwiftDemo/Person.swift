//
//  Person.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/4.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String?
    
    //override 重写
    override init() {
        name = "老王"
        
        super.init()
    }
    
    //重载 , 函数名相同,  但是参数和个数不同
    //重载可以给自己的属性从外部设置初始值
    //OC里面没有重载
    init(name:String) {
        self.name = name
        
        super.init()
    }
}


class Student: Person {
    var age : String?
    
    override init() {
        age = "10"
        
        super.init()
    }
    
    init(age:String , name:String) {
        self.age = age
        
        super.init(name: name)
        
    }
    
    //private 的属性,使用运行时,同样获取不到属性(可以获取ivar),同样或让KVC崩溃
    
    //类方法  使用 运行时  获取当前类的所有属性
    class func propertyList() -> [String] {
        
        //可变的UInt32类型的指针
        var count: UInt32 = 0
        
        //1:获取类的属性列表 , 返回属性列表的数组 , 可选项
        let list = class_copyPropertyList(self, &count)
        print("属性的数量\(count)")
        
//        //2:遍历数组
//        for i in 0..<Int(count) {
//            //3:根据下标获取属性
//            //objc_property_t
//            let pty = list?[i]
//
//            //4:获取 属性的名称 C语言字符串
//            //Int8 -> Byte -> Char -> C 语言字符串
//            let cName = property_getName(pty!)
//
//            //5:转换成String字符串
//            let name = String(utf8String:cName)
//
//            print(name!)
//        }
        
        
        
        
//        for i in 0..<Int(count) {
//
//            guard let pty = list?[i],
//                let cName = property_getName(pty),
//                let name = String(utf8String:cName)
//            else {
//                continue
//            }
//
//            print(name)
//        }
        
        return []
    }
    
    
    
    
}
