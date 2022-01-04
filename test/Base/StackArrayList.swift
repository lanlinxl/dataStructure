//
//  StackArrayList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/5.
//  Copyright © 2020 ll. All rights reserved.
//
//动态数组实现栈 为了方便 栈的内容为Int类型


import UIKit

class StackArrayList: NSObject {

    private var arrayList : [Int]?
    
    override init() {
       arrayList = [Int]()
    }

    //入栈
    func push(data: Int) {
        
        arrayList?.append(data)
    }
    
    //出栈
    func pop(){
        if arrayList!.count > 0 {
           arrayList?.removeLast()
        }
          
        if arrayList!.count == 0 {
            print("栈为空了！")
        }
    
    }
    
    //获取栈顶元素
    func getTop() -> Int?{
        
        if arrayList!.count <= 0 {
            return nil
        }
        
        let index = arrayList?.count
        let topData = arrayList?[index! - 1]
        
        return topData!
    }
    
    //栈的大小
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
