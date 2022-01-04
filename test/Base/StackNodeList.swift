//
//  StackNodeList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/5.
//  Copyright © 2020 ll. All rights reserved.
//
//使用双向链表实现

import UIKit

class StackNodeList: NSObject {

    private var nodeList : DNodeList?
       
    
    override init() {
        nodeList = DNodeList()
    }
    
    //入栈
    func push(data: Int) {
        
        nodeList?.addNodeAtLast(data: data)
        
    }
    
    //出栈
    func pop(){
        
        if (nodeList?.getNodeLength())! > 0{
            nodeList?.removeNodeLast()
        }
        
       if nodeList!.getNodeLength() == 0 {
          print("栈为空了！")
        }
    }
    
    //获取栈顶元素
    func getTop() -> Int?{
        
        if (nodeList?.getNodeLength())! <= 0{
            return nil
        }
        
        let index = (nodeList?.getNodeLength())! - 1
        let node = nodeList?.getIndexNode(index)
        
        return node?.data
    }
    
    //栈的大小
    func size() -> Int{
        
        return nodeList?.getNodeLength() ?? 0
    }
    
    //是否为空
    func isEmpty() -> Bool{
        
        let isEmpty = nodeList!.getNodeLength() > 0 ? false : true
        
        return isEmpty
    }
    
    //清空
    func clear(){
        
        nodeList?.removeAll()
    }
    
    
}
