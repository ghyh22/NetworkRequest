//
//  ViewController.swift
//  NetworkRequest
//
//  Created by 龚浩 on 16/11/29.
//  Copyright © 2016年 龚浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        JSONRequest.jsonRequest(url: "http://dev.gn100.com/interface/login", para: "", result: {
            (data, error) in
            if error != nil {
                print(error!)
            }else{
                print(data!)
            }
        })
        print("ffff")
    }
}

