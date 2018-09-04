//
//  ViewController.swift
//  NCTools
//
//  Created by letneilgo@163.com on 08/28/2018.
//  Copyright (c) 2018 letneilgo@163.com. All rights reserved.
//

import UIKit
import NCTools

class Person:NSObject,NSCoding {
    
    var name:String = "Neil"
    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = Person.init()
        a.name = "NeilChen"
        let data = Data.encodeWith(obj: a)
        let b:Person = Data.decodeWith(data: data)!
        print(b.name)
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

