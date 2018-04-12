
//
//  Bundle+Extension.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/12.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import Foundation

extension Bundle {
    
    //返回命名空间字符串
//    func namespace () -> String {
////        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    //计算型属性类似于函数, 没有参数,  有返回值 (OC 中 的函数,若没有参数,有返回值, 可用打点调用    [str copy] -> str.copy)
    var namespace:String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
