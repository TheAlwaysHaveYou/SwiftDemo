//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by fan on 2018/3/29.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /*
     1.知道 Swift 中有命名空间
        - 在同一个命名空间下, 全局共享
        - 第三方框架使用Swift 如果直接拖拽到项目中,从属于同一个命名空间,很可能发生冲突
        - 以后尽量都是用 cocoapod
     2.重点要知道 Swift 中 NSClassFromString(反射机制) 的写法
        - 反射最重要的目的,就是为了解耦
        - 搜索 '反射机制 和 工厂方法'
        - 提示: 第一印象会发现一个简单的功能,写的很复杂
        - 但是封装的很好,而且弹性很大
     */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //*** 代码中的 ? 都是'可选'解包 , 发送消息,不参与计算
        //所有的 ? 都是 Xcode 自动添加的
        //1.实例化 window
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        //输出 Bundle info.plist 的内容
        //[String : Any]?
        print(Bundle.main.infoDictionary)
        /* ***  解包  ***
            1.因为字典是可选的,因此需要解包取值
             如果字典为nil,就不取值
            2.通过key从字典中取值, 如果 key错了, 就没有值了
             AnyObject? 表示不一定能够获得值
        */
        let ns = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        
        
        //2.设置 跟控制器 , 需要添加 命名空间 -> 默认就是'项目名称(最好不要使用数字和特殊符号)'
//        let clsName = "SwiftDemo.BaseUIController"
        let clsName = ns + "." + "BaseUIController"
        
        // AnyClass? -> 视图控制器类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        
        //使用类创建试图控制器
        //UIViewController?
        let vc = cls?.init()
        
        //let vc = ViewController()
        window?.rootViewController = vc
        
        //3. 让window 可见
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

