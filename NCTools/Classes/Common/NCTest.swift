//
//  NCTest.swift
//  CryptoSwift
//
//  Created by 谌志伟 on 2018/9/7.
//

import Foundation


public class NCTest{
    
    ///测试某段程序代码运行时间
    public class func period(_ cloure:()->Void)->Double{
        let start = CFAbsoluteTimeGetCurrent()
        cloure()
        
        return Double(CFAbsoluteTimeGetCurrent()-start)
    }
    
    
    
    
    
    
}
