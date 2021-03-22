//
//  BaseTabBarController.swift
//  ProjiectDemon
//
//  Created by lzwk_lanlin on 2020/7/29.
//  Copyright © 2020 lzwk_lanlin. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController ,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        self.delegate = self
    }
    
    private func setupSubviews() {
        // 首页
        let homeVC = HomeViewController()
        let homeNavigationVC = UINavigationController(rootViewController: homeVC)
        addChild(controller: homeNavigationVC, title: "数据结构", imageName: "Tabbar_Discovery_Normal", selectedImageName: "Tabbar_Discovery_Selected")
        
        
        // 我的微课
        let ModuleVC = ModuleViewController()
        let myWekeNavVc = UINavigationController(rootViewController: ModuleVC)
        addChild(controller: myWekeNavVc, title: "算法思想", imageName: "Tabbar_MyWeike_Normal", selectedImageName: "Tabbar_MyWeike_Selected")
        
        // 个人中心
        let studyVC = StudyViewController()
            let profileNavigationVC = UINavigationController(rootViewController: studyVC)
            addChild(controller: profileNavigationVC, title: "算法题", imageName: "Tabbar_Profile_Normal", selectedImageName: "Tabbar_Profile_Selected")
        
        
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = UIColor.gray
        }
    }
        
    /// 添加子控制器
    private func addChild(controller: UIViewController?, title: String, imageName: String, selectedImageName: String) {
        guard let viewController = controller else { return }
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        viewController.tabBarItem.title = title
        viewController.tabBarItem.setTitleTextAttributes(attributes, for: .selected)
        if let image = UIImage(named: imageName) {
            viewController.tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        }
        if let seletedImage = UIImage(named: selectedImageName) {
            viewController.tabBarItem.selectedImage = seletedImage.withRenderingMode(.alwaysOriginal)
        }
        addChildViewController(viewController)
    }
}

extension BaseTabBarController {
    //tabbar 点击index 用于埋点统计
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
   
        print("\(tabBarController.selectedIndex)")
    }
    
    //这里可以拦截item的点击
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

// MARK: - 旋转方向相关
extension BaseTabBarController {
    
    override var shouldAutorotate: Bool {
        if let navVC = self.selectedViewController as? UINavigationController {
            return navVC.visibleViewController?.shouldAutorotate ?? false
        }
        if let vc = self.selectedViewController {

            return vc.shouldAutorotate
        }
        return false
    }

    /// 不可直接返回值，子 VC 可能自定义旋转方向（比如录播课自动旋转进入播放器全屏）默认值传回 info.plist / proj settings 中的缺省值（Portrait）
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if let navVC = self.selectedViewController as? UINavigationController {
            return navVC.visibleViewController?.supportedInterfaceOrientations ?? .portrait
        }
        if let vc = self.selectedViewController {

            return vc.supportedInterfaceOrientations
        }
        return [.portrait,.landscapeRight]
        
    }


    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        
        return .portrait
    }


}
