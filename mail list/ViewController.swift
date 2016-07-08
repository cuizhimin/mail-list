//
//  ViewController.swift
//  mail list
//
//  Created by czm on 16/7/8.
//  Copyright © 2016年 czm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var db:SQLiteDB!
    
    @IBOutlet weak var textname: UITextField!
    @IBOutlet weak var textmobile: UITextField!
    @IBOutlet weak var textqq: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),qq varchar(20))")
        //如果有数据则加载
        
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //保存数据到SQLite
    func saveUser() {
        let textname = self.textname.text!
        let textmobile = self.textmobile.text!
        let textqq = self.textqq.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into user(name,mobile,qq) values('\(textname)','\(textmobile)','\(textqq)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

