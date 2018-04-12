//
//  GCDController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/3.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class GCDController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //"尾"随闭包  如果函数的最后一个参数是闭包 , 函数参数可以提前结束 , 最后一个参数直接使用 {}来包装必报的代码
        loadData { (result) in
            print(result)
        }
        
        /*按照函数本身的样子来写的
        loadData(complete: {(result) -> ()
            
        })
        */
        
    }

    func loadData(complete : @escaping ( _ result : [String]) -> ()) -> () {
        //全局队列, 异步
        DispatchQueue.global().async {
            print("\(Thread.current)")
            
            Thread.sleep(forTimeInterval: 1.0)//休眠一秒
            
            DispatchQueue.main.async(execute: {
                //回到主线程 刷新UI
                complete([""])
            })
        }
        
    }
    
    func demo() {
        //尾随闭包
        DispatchQueue.global().async {
            
            //嵌套的GCD  不会变成尾随闭包
            DispatchQueue.global().async(execute: {
                
            })
        }
    }

}
