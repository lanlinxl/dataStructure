//
//  ModuleViewController.swift
//  ProjiectDemon
//
//  Created by lzwk_lanlin on 2020/7/29.
//  Copyright © 2020 lzwk_lanlin. All rights reserved.
//

import UIKit
import SnapKit
class ModuleViewController: BaseViewController {

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
        dataSource = ["分页控制器"]
        tableView.reloadData()
    }

    func setupViews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:"ModuleViewController")
    }

}

 //MARK: UITableViewDelegate && UITableViewDataSource
extension ModuleViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ModuleViewController") else { return UITableViewCell()}
  
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
