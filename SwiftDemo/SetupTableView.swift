//
//  SetupTableView.swift
//  SwiftDemo
//
//  Created by fan on 2018/4/2.
//  Copyright © 2018年 fan kuidong. All rights reserved.
//

import UIKit

class SetupTableView: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    func setupSubviews() {
        let tableview = UITableView(frame:view.bounds, style:.plain)
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self;
        tableview.dataSource = self;
        
        view.addSubview(tableview)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        cell.textLabel?.text = "Hellow World"
        
        return UITableViewCell()
    }
}

