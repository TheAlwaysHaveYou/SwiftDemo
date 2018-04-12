//
//  URLController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/10.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class URLController: UITableViewController {

    //闭包的返回值是可选的
    //    var completionCallBack: ()->()?
    //闭包是可选的
    var completionCallBack: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //URL 的构造函数可以返回nil
        // 构造函数就是实例化对象的
        let url = URL(string: "http://www.baidu.com")

        //发起网络请求
        // - 跟 OC的区别 , 闭包所有参数,需要自己写 , OC是直接带入
        // - 如果不关心的值, 可以直接用户 _ 忽略
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if (error != nil) {
                print("报错啦 \(String(describing: error))")
                return
            }
            
            guard let data = data else {
                print("报错啦 \(String(describing: error))")
                
                return
            }
            //将data转换为String
            let html = String(data:data , encoding:.utf8)
//            print(html!)
            
        }.resume()
        
        
        
        
    }

    @IBAction func controllerGoBack(_ sender: Any) {
        //OC 中执行block前必须判断是否为空 , 否则容易崩溃
        // ! 强行解包(Xcode 帮助修订, 一定不要 用 '!')
        // ? 可选解包 -> 如果闭包为nil 就什么都不做
        
        completionCallBack?()
    }
}

//便利构造函数

class Boy : NSObject {
    var name:String?
    var age:Int = 0
    
    //重载构造函数
    /*
     1.便利构造函数允许返回 nil
        - 正常的构造函数一定创建对象
        - ** 判断给定的参数是否符合条件 , 如果不符合条件 , 直接返回nil,不会创建对象,减少内存开销 **
     2. ** 只有 ** 便利构造函数中使用 'self.init' 构造当前对象
        - 没有 convenience 关键字的构造函数是负责创建对象的, 反之是用来检查条件的, 本身不负责对象的创建
     3.如果要在便利构造函数中使用 当前对象的属性 , 一定要在 self.init 之后
     */
    
    convenience init?(name:String, age:Int) {
        if age > 100 {
            return nil
        }
        
        //使用self访问 name 之前 , 应该调用self.init
        //实例化当前对象
        self.init()
        //执行到此 self 才允许被访问 , 才能够访问到对象的属性
        self.name = name
    }
    
    override init() {
        super.init()
    }
}



