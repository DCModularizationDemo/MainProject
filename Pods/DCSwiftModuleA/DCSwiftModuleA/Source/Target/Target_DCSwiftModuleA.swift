//
//  Target_DCSwiftModuleADemo.swift
//
//  Created by casa on 2020/2/21.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit

@objc class Target_DCSwiftModuleA: NSObject {
    @objc func Action_demo(_ params:[AnyHashable:Any]) -> UIViewController? {
        guard let name = params["name"] as? String else { return nil }
        
        if let callback = params["callback"] as? (String) -> Void {
            callback("hello \(name) !")
        }
        
        let viewController = DemoViewController()
        return viewController
    }
    @objc func Action_ShowSwiftAViewController(_ params:[AnyHashable:Any]) -> UIViewController? {
        guard let currentViewController = params["viewController"] as? UIViewController else { return nil }
        if let callback = params["callback"] as? (String) -> Void {
            callback("success")
        }
        let viewController = DemoViewController()
        currentViewController.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
}
