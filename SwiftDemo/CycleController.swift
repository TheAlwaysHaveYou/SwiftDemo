//
//  CycleController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/3.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class CycleController: UIViewController {

    
    //属性就是一个var
    var completeCallBack : (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //解决循环引用
        //方法 一    OC类似方法
        //weak  可能会被运行时被修改 , -> 指向的对象一旦被释放, 会被自动设置为nil , 所以只能用var
        weak var weakSelf = self
        loadData {
            //解包有两种方式
            //? 可选解包   如果self已经被释放,不会向对象发送 getter 的信息 , 更加安全合理
            //! 强行解包   如果self已经被释放,强行解包会导致崩溃
            
            /*
             weakSelf?.view  只是单纯的发送消息,不做计算
             强行解包,因为需要计算,可选项不能直接参与计算
             */
            print(weakSelf?.view)
        }
        
        
        //方法二  Swift 推荐方法
        //[weak self] 表示 {}中的所有self都是弱引用 , 需要注意解包
        //相当于 OC 的 __weak
        loadData { [weak self] in
            print(self?.view)
        }
        
        //方法三  Swift的另一个用法 , 知道就好
        //[unowned self] 表示 {} 中的所有self都是 assign 的, 不会强引用 , 但是如果对象释放, 指针地址不会变化
        //如果对象释放,继续调用, 就会出现野指针的问题
        //相当于 OC 的 __unsafe_unreatined
        loadData { [unowned self] in
            print(self.view)
        }
    }
    
    func loadData(complete: @escaping () -> ()) -> () {
        completeCallBack = complete//循环引用
        
        DispatchQueue.global().async {
            
            //延时操作
            DispatchQueue.main.async(execute: {
                complete()
            })
        }
    }
    
    //没有func -> 不让调用
    //没有 () -> 不能重载
    //在对象被销毁前自动调用
    
    deinit {
        //类似于 OC  dealloc
        
        //1.跟踪对象的销毁
        //2.必须释放的
        /*
         - 通知,不释放不会崩溃, 但是会泄漏
         - KVC , 不释放会崩溃
         - NSTimer / CADisplayLink
         */
    }
}
