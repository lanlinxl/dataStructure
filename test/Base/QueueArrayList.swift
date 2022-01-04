//
//  QueueArrayList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/5.
//  Copyright © 2020 ll. All rights reserved.
//

import UIKit

class QueueArrayList: NSObject {

    private var arrayList : [Int]?
    
    override init() {
       arrayList = [Int]()
    }

    //入队
    func enQueue(data: Int) {
        
        arrayList?.append(data)
    }
    
    //出队
    func deQueue(){
        if arrayList!.count > 0 {
           arrayList?.removeFirst()
        }
          
        if arrayList!.count == 0 {
            print("队列为空了！")
        }
    
    }
    
    //获取队列首元素
    func getFront() -> Int?{
        
        if arrayList!.count <= 0 {
            return nil
        }
        let topData = arrayList?.first
        
        return topData!
    }
    
    //队列的大小
    func size() -> Int{
        
        return arrayList?.count ?? 0
    }
    
    //是否为空
    func isEmpty() -> Bool{
        
        let isEmpty = arrayList!.count > 0 ? false : true
        
        return isEmpty
    }
    
    //清空
    func clear(){
        
        arrayList?.removeAll()
        
    }
    
    
}
