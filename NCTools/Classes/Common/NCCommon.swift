//
//  File.swift
//  NCProject
//
//  Created by 谌志伟 on 2018/8/15.
//  Copyright © 2018年 谌志伟. All rights reserved.
//

import Foundation


public func NCPrint(_ obj:Any?){
    guard obj != nil else {
        return
    }
    debugPrint(obj!)
}



