//
//  ExerciseController.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/10.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class ExerciseController: UITableViewController {

    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    var personList = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadData { (list) in
            //闭包中定义好的代码在需要的时候执行 , 需要self. 指定语境
            self.personList += list
            
            self.tableView.reloadData()//巴拉巴拉------
        }
    }
    
    private func loadData(completion:@escaping (_ list:[Person]) -> ()) -> () {
        DispatchQueue.global().async {
            print("努力加载中")
            
            var arrayM = [Person]()
            
            for i in 0..<20 {
                let p = Person()
                
                p.name = "fan --- \(i)"
                
                arrayM.append(p)
            }
            
            DispatchQueue.main.async(execute: {
                completion(arrayM)
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.detailTextLabel?.text = "范范"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //界面跳转
        performSegue(withIdentifier: "URLID", sender: indexPath)
    }
    
    //控制器跳转的时候 都会执行这个方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //转换类型 as
        //Swift 中 String之外, 绝大多数使用 as 需要 ? / !
        //as!  /  as? 直接根绝前面的返回值来决定
        //注意 if let / guard let 判空语句 一律用  as?
        let vc = segue.destination as! URLController
        
        print(vc)
        if let indexPath = sender as? IndexPath {
            //indexPath 一定有值
            //有索引了, 就能传值了 personList[indexPath.row]
            
            //这是控制器的闭包, 传值回调
            vc.completionCallBack = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
