//
//  JsonParse.swift
//  NetworkRequest
//
//  Created by 龚浩 on 16/11/29.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class JSONParse: NSObject {
    /**
     对象转成JSON数据
    **/
    static func toJSON(data:Any)->Data? {
        if JSONSerialization.isValidJSONObject(data) {
            do{
                let result = try JSONSerialization.data(withJSONObject: data, options: [])
                return result
            }catch{
                print("JOSN化失败")
            }
        }
        return nil
    }
    /**
     JSON数据转成对象
    **/
    static func toAny(json:Data)->Any?{
        do{
            let result = try JSONSerialization.jsonObject(with: json, options: [])
            return result
        }catch{
            print("转化失败")
        }
        return nil
    }
}
