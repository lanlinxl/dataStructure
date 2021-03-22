//
//  HomeViewController.swift
//  ProjiectDemon
//
//  Created by lzwk_lanlin on 2020/7/29.
//  Copyright © 2020 lzwk_lanlin. All rights reserved.
//

import UIKit
import SnapKit
class HomeViewController: BaseViewController {

    lazy var tableView : UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .gray
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    lazy var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        initDataInfo()
        
    }
    
    func initDataInfo(){
        dataSource = ["单向链表","双向链表","动态数组","栈","队列","二叉树"]
        tableView.reloadData()
    }

    func setupViews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:"HomeViewController")
    }

}

 //MARK: UITableViewDelegate && UITableViewDataSource
extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewController") else { return UITableViewCell()}
  
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消选中的状态
       

    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    /// 不可直接返回值，子 VC 可能自定义旋转方向（比如录播课自动旋转进入播放器全屏）默认值传回 info.plist / proj settings 中的缺省值（Portrait）
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
}
