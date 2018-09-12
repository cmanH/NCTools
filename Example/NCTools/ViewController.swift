//
//  ViewController.swift
//  NCTools
//
//  Created by letneilgo@163.com on 08/28/2018.
//  Copyright (c) 2018 letneilgo@163.com. All rights reserved.
//

import UIKit
import NCTools
import CryptoSwift

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
        
        //print()
        print(NCDevice.identifier)
        
        let a = "Hello,World"
        
        let b = a.subString(to: 4)
        let c = a.subSting(from: 2)
        let d = a.sub(startIdx: 3, endIdx: 7)
        
        print(b + "\n" + c + "\n" + d )
        
        
    
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

