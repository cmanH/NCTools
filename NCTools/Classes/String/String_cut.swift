//
//  String_cut.swift
//  CryptoSwift
//
//  Created by 谌志伟 on 2018/9/12.
//

import Foundation


public extension String{
    
    
    ///用下标取字符串
    public func sub(startIdx:Int,endIdx:Int)->String{
        guard endIdx > startIdx else {
            return ""
        }
        guard endIdx < self.count else {
            return ""
        }
        let sIdx = self.index(self.startIndex, offsetBy: startIdx)
        let eIdx = self.index(self.startIndex, offsetBy: endIdx)
        
        return String(self[sIdx..<eIdx])
    }
    
    /// 截取字符串，从下标from 到结尾
    public func subSting(from:Int)->String{
        guard self.count > from else {
            return ""
        }
        
        let start = self.index(self.startIndex, offsetBy: from)
        return String(self[start...])
    }
    
    
    ///截取字符串，从开始到to
    public func subString(to:Int)->String{
        guard self.count > to else {
            return ""
        }
        
        let end = self.index(startIndex, offsetBy: to)
        return String(self[..<end])
    }
    
    
    func sliceByCharacter(from: Character, to: Character) -> String? {
        guard self.contains(from) && self.contains(to) else {
            return ""
        }
        let fromIndex = self.index(self.index(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.index(of: to)!, offsetBy: -1)
        guard toIndex > fromIndex else {
            return ""
        }
        return String(self[fromIndex...toIndex])
    }
    
    
    func sliceByString(from:String, to:String) -> String? {
        //From - startIndex
  
        if let range = self.range(of: from){
            let subString = String(self[range.upperBound...])
            
            //To - endIndex
            if let rang2 = subString.range(of: to){
                return String(subString[..<rang2.lowerBound])
            }
        }
        return ""
    }
    
    
}
