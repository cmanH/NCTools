//
//  NCFileManager.swift
//  NCProject
//
//  Created by 谌志伟 on 2018/8/15.
//  Copyright © 2018年 谌志伟. All rights reserved.
//

import UIKit

public class NCFileManager: NSObject {
    ///判断文件是否存在某路径
    public class func isFileExistAt(path:String)->Bool{
        return FileManager.default.fileExists(atPath:path)
    }
    
    
    
    ///移除路径上的文件
    public class func removeFileFrom(path:String)->Bool{
        if isFileExistAt(path: path){
            
            do{
                try FileManager.default.removeItem(atPath: path)
                return true
            }catch{
                NCPrint(error)
                return false
            }
         
        }
        return false
    }
    
    
    ///移除url上的文件
    public class func removeFileWith(url:URL)->Bool{
        if isFileExistAt(path: url.path){
            do{
                try FileManager.default.removeItem(at: url)
                return true
            }catch{
                NCPrint(error)
                return false
            }
        }
        return false
    }
    
    ///创建文件路径
    public class func creatDictionaryAt(path:String)->Bool{
        
        let isExist = isFileExistAt(path: path)
        guard !isExist else {
            return true
        }
        do{
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            return true
        }catch{
            NCPrint(error)
            return false
        }
    }
    
    
    ///创建文件
    public class func creatFileAt(_ path:String)->Bool{
        guard isFileExistAt(path: path) else {
            return true
        }
        let dirpath = (path as NSString).deletingLastPathComponent
        
        
        guard creatDictionaryAt(path: dirpath) else {
            return false
        }
        
        return FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
    }
    
    ///保存文件
    public class func saveFile(_ filePath:String,data:Data)->Bool{
        guard creatFileAt(filePath) else {
            return false
        }
        guard let url = URL.init(string: filePath) else {
            return false
        }
        do{
            try data.write(to: url)
            return true
        }catch{
            NCPrint(error)
            return false
        }
    }
    
    ///追加写文件
    public class func append(data:Data,path:String)->Bool{
        guard creatFileAt(path) else {
            return false
        }
        let handlle = FileHandle.init(forWritingAtPath: path)
        handlle?.seekToEndOfFile()
        handlle?.write(data)
        handlle?.synchronizeFile()
        handlle?.closeFile()
        return true
    }
    
    /// 获取文件
    public class func getFileData(path:String)->Data?{
        let handdle = FileHandle.init(forReadingAtPath: path)
        let data = handdle?.readDataToEndOfFile()
        handdle?.closeFile()
        return data
    }
    
    
    ///读取文件
    public class func getFileData(filePath:String,startIndex:UInt64,length:Int)->Data?{
        let handdle = FileHandle.init(forReadingAtPath: filePath)
        handdle?.seek(toFileOffset: startIndex)
        let data = handdle?.readData(ofLength: length)
        handdle?.closeFile()
        return data
    }
    
    //移动数据
    public class func moveData(from _path:String,to path:String)->Bool{
        guard isFileExistAt(path: _path),!isFileExistAt(path: path) else {
            return false
        }
     
        let headerComponet = (path as NSString).deletingLastPathComponent
        guard creatFileAt(headerComponet) else {
            return false
        }
        do{
            try FileManager.default.moveItem(atPath: _path, toPath: path)
            return true
        }catch{
            NCPrint(error)
            return false
        }
        
    }
    
    ///拷贝文件
    public class func copyFile(from fpath:String,to tPath:String)->Bool{
        guard isFileExistAt(path: fpath) else {
            NCPrint("fromPath is nil")
            return false
        }
        
        guard !isFileExistAt(path: tPath) else {
            NCPrint("to path is nil")
            return false
        }
        
        let headerComponent = (tPath as NSString).deletingLastPathComponent
        guard creatFileAt(headerComponent) else {
            NCPrint("creat to path failed")
            return false
        }
        
        do{
            try FileManager.default.copyItem(atPath: fpath, toPath: tPath)
            return true
        }catch{
            NCPrint(error.localizedDescription)
            return false
        }
    }
    
    ///获取文件夹下的文件列表
    public class func getFileList(from path:String)->[String]{
        do{
            return try FileManager.default.contentsOfDirectory(atPath: path)
        }catch{
            NCPrint(error.localizedDescription)
            return []
        }
        
    }
    ///获取文件大小
    public class func getFileSize( _ path:String)->UInt64{
        var temp:[FileAttributeKey:Any] = [:]
        do{
            let attr = try FileManager.default.attributesOfFileSystem(forPath: path)
            temp = attr
        }catch{
            NCPrint(error.localizedDescription)
        }
        if let fileSize = temp[FileAttributeKey.size] as? UInt64 {
            return fileSize
        }
        return 0
        
    }
    
    ///获取文件创建时间
    public class func getFileCreatTime(_ path:String)->Date?{
        var temp:[FileAttributeKey:Any] = [:]
        do{
            let attr = try FileManager.default.attributesOfFileSystem(forPath: path)
            temp = attr
        }catch{
            NCPrint(error.localizedDescription)
        }
        if let date = temp[FileAttributeKey.creationDate] as? Date {
            return date
        }
        return nil
    }
    
    ///获取文件拥有者
    public class func getFileOwer(path:String)->String{
        var temp:[FileAttributeKey:Any] = [:]
        do{
            let attr = try FileManager.default.attributesOfFileSystem(forPath: path)
            temp = attr
        }catch{
            NCPrint(error.localizedDescription)
        }
        if let name = temp[FileAttributeKey.ownerAccountName] as? String {
            return name
        }
        return ""
    }
    
    ///获取文件改变时间
    public class func getFileChangeDate(path:String)->Date?{
        var temp:[FileAttributeKey:Any] = [:]
        do{
            let attr = try FileManager.default.attributesOfFileSystem(forPath: path)
            temp = attr
        }catch{
            NCPrint(error.localizedDescription)
        }
        if let date = temp[FileAttributeKey.modificationDate] as? Date {
            return date
        }
        return nil
       
    }
    
}
