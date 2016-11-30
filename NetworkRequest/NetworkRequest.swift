//
//  NetworkRequest.swift
//  NetworkRequest
//
//  Created by 龚浩 on 16/11/29.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class NetworkRequest: NSObject {
    static func request(url:String, para:String?, result:@escaping (Data?, _ error:String?)->Void){
        if let tmpURL = URL(string:url) {
            var request = URLRequest(url: tmpURL)
            request.httpMethod = "POST"
            let sessionConfig = URLSessionConfiguration.default
            sessionConfig.timeoutIntervalForRequest = 20
            let session = URLSession(configuration: sessionConfig)
            let body = para?.data(using: String.Encoding.utf8)
            let task = session.uploadTask(with: request, from: body, completionHandler: {
                (data, response, error) ->Void in
                if error != nil {
                    result(nil, error!.localizedDescription)
                    return;
                }
                result(data, nil)
            })
            task.resume()
        }else{
            result(nil, "请求地址出错")
        }
    }
}
