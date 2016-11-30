//
//  JSONRequest.swift
//  NetworkRequest
//
//  Created by 龚浩 on 16/11/29.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class JSONRequest: NSObject {
    /**
     请求返回后将json数据转化为对象数据
    **/
    static fileprivate var result:((Any?, _ error:String?)->Void)?
    static func jsonRequest(url:String, para:String, result:@escaping (Any?, _ error:String?)->Void)->Void{
        self.result = result
        NetworkRequest.request(url: url, para: para, result: requestResult)
    }
    static fileprivate func requestResult(data:Data?, error:String?)->Void{
        if data != nil {
            if let tmp = JSONParse.toAny(json: data!) {
                self.result?(tmp, error)
                return
            }else{
                self.result?(nil, "转化失败")
                return
            }
        }
        self.result?(nil, error)
    }
}
