//
//  NCUserDefault.swift
//  NCProject
//
//  Created by 谌志伟 on 2018/8/20.
//  Copyright © 2018年 谌志伟. All rights reserved.
//

import UIKit
import Foundation



public enum NCUserDefaultSaveType {
    case bool(flag:Bool,key:String)
    case int(obj:Int,key:String)
    case double(obj:Double,key:String)
    case float(obj:Float,key:String)
    case data(data:Data,key:String)
    case array(array:Array<Any>,key:String)
    case string(string:String,key:String)
    case dictianry(dic:[String:Any],key:String)
    
}

///存数据到preference
public extension UserDefaults{
    public class func save(value:NCUserDefaultSaveType){
        let storage = UserDefaults.standard
        switch value {
        case .bool(let obj):
            storage.set(obj.flag, forKey: obj.key)
        case .int(let obj):
            storage.set(obj.obj, forKey: obj.key)
        case .double(let obj):
            storage.set(obj.obj, forKey: obj.key)
        case .float(let obj):
            storage.set(obj.obj, forKey: obj.key)
        case .data(let obj):
            storage.set(obj.data, forKey: obj.key)
        case .dictianry(let obj):
            guard obj.dic.count != 0 else{
                fatalError("dictionary can not be empty")
                return
            }
            
            for (_,v) in obj.dic{
                
                
            }
            
            
            
        default:
            break
        }
    }
    
    
    
    
    
    
}
