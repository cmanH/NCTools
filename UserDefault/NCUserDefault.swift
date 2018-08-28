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
    case any(obj:Any,key:String)
}

///存数据到preference
public extension UserDefaults{
    
    
    ///保存数据到Preference
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
        case .array(let obj):
            storage.set(obj.array, forKey: obj.key)
        case .string(let obj):
            storage.set(obj.string, forKey: obj.key)
        case .dictianry(let obj):
            storage.set(obj.dic, forKey: obj.key)
        case .any(let obj):
            storage.set(obj.obj, forKey: obj.key)

        }
        storage.synchronize()
    }
  
}

public extension Data{
    
    //将对象编译成Data
    public static func encodeWith(obj:Any)->Data{
        let data = NSKeyedArchiver.archivedData(withRootObject: obj)
        return data
    }
    
    ///反编译data成对象
    public static func decodeWith<T>(data:Data)->T?{
        let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? T
        return obj
    }
    
}
