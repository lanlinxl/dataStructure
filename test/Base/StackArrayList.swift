//
//  StackArrayList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/5.
//  Copyright © 2020 ll. All rights reserved.
//
//动态数组实现栈 为了方便些算法 栈的内容为TreeNode类型


import UIKit

class StackArrayList: NSObject {

    private var arrayList : [TreeNode]?
    
    override init() {
       arrayList = [TreeNode]()
    }

    //入栈
    func push(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        arrayList?.append(node)
    }
    
    //出栈
    func pop() -> TreeNode?{
        if arrayList?.count ?? 0 > 0 {
            let node = arrayList?.removeLast()
            return node
        }
        return nil
    }
    
    //获取栈顶元素
    func getTop() -> TreeNode?{
        guard let list = arrayList else { return nil }
        if list.count <= 0 {
            return nil
        }
        return list.first
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
