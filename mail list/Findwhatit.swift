//
//  Findwhatit.swift
//  mail list
//
//  Created by czm on 16/7/10.
//  Copyright © 2016年 czm. All rights reserved.
//
import UIKit

class Findwhatit: UIViewController {
    
    @IBOutlet weak var text1: UITextView!
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tuser(uid integer primary key,name varchar(20),mobile varchar(20),qq varcher(20))")
    }
    
    @IBAction func look(sender: AnyObject) {
        look()
    }
    
    func look(){
        text1.text=""
        let data = db.query("select * from user")
        for var x=0;x<data.count;x++
        {
            let user = data[x]
            text1.text! += "联系人:" + String(user["name"]!) + "\n" + "联系方式:" + String(user["mobile"]!) + "\n" + "QQ:" + String(user["qq"]!) + "\n"
        }

    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}