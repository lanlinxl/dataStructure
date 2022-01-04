//
//  QueueNodeList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/5.
//  Copyright © 2020 ll. All rights reserved.
//

import UIKit

class QueueNodeList: NSObject {

    private var nodeList : DNodeList?
    
    override init() {
        nodeList = DNodeList()
    }
    
     //入队
    func enQueue(data: Int) {
        
        nodeList?.addNodeAtLast(data: data)
    }
    
     //出队
    func deQueue(){
        
        if (nodeList?.getNodeLength())! > 0{
            nodeList?.removeNodeFirst()
        }
        
       if nodeList!.getNodeLength() == 0 {
          print("栈为空了！")
        }
    }
    
     //获取队列首元素
    func getFront() -> Int?{
        
        if (nodeList?.getNodeLength())! <= 0{
            return nil
        }
        
        let node = nodeList?.getIndexNode(0)
        
        return node?.data
    }
    
   //队列的大小
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
