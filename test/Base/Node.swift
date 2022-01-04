//
//  Node.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/1.
//  Copyright © 2020 ll. All rights reserved.
//
//节点单元

import UIKit

class Node: NSObject {
    var nextNode : Node? //下一个节点
    
    var preNode : Node? //上一个节点
    
    var data : Int? //节点中包含的数据一般为对象好一些 这里为了方便设为int类型属性
    
    var val : Int = 0
    
}
