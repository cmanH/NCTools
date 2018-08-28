//
//  NCFileContext.swift
//  NCProject
//
//  Created by 谌志伟 on 2018/8/15.
//  Copyright © 2018年 谌志伟. All rights reserved.
//

import UIKit

public class NCFileContext: NSObject {
    
    ///Document路径
    public class var documentPath:String{
        let filePaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        guard filePaths.count > 0 else {
            return ""
        }
      
        return filePaths[0]
    }
    
    
    ///Library路径
    public class var libraryPath:String{
        let filePaths = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
        guard filePaths.count > 0 else {
            return ""
        }
        NSDecimalNumber
        return filePaths[0]
    }
    
    
    ///application路径
    public class var applicationPath:String{
        return NSHomeDirectory()
    }
    
    
    ///cache 路径
    public class var cachePath:String{
        let filePaths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        guard filePaths.count > 0 else {
            return ""
        }
        return filePaths[0]
    }
    
    ///temp路径
    public class var tempPath:String{
        return NSTemporaryDirectory()
    }

}
