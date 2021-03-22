//
//  BaseNavigationController.swift
//  Weike
//
//  Created by Fancheng Pang on 2019/7/17.
//  Copyright © 2019 Senji. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
