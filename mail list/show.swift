//
//  show.swift
//  mail list
//
//  Created by czm on 16/7/8.
//  Copyright © 2016年 czm. All rights reserved.
//

import Foundation

import UIKit

class showoneController: UIViewController {
    
    
    @IBOutlet weak var edit: UITextField!
    @IBOutlet weak var view1: UITextView!
    
    var db:SQLiteDB!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,name varchar(20),mobile varchar(20),qq varchar(20))")
        //如果有数据则加载
        //show1()
    }
    @IBAction func query(sender: AnyObject)
    {
        select()
    }
    
    func select() {
        let name1=edit.text!
        let data = db.query("select * from user where name='\(name1)'")
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            view1.text! += "联系人:" + String(user["name"]!) + "\n" + "联系方式:" + String(user["mobile"]!) + "\n" + "QQ:" + String(user["qq"]!) + "\n"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}