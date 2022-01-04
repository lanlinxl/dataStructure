//
//  DNodeList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/3.
//  Copyright © 2020 ll. All rights reserved.
//

/*
主要思路 在单向链表的基础上
 1.新增一个虚拟节点lastNode
 2.添加一个preNode 指向上一个节点，每添加一个或者删除一个节点 都要对nextNode和preNode做处理
 3.查找遍历通过判断index大概的位置是在链表前半部分还是后半部分来确定是从前面遍历还是从后面遍历，平均时间复杂度是单向链表的1/2
**/

import UIKit

class DNodeList: NSObject {
    
    private var firstNode : Node?
    
    private var lastNode : Node?
    
    private var size : Int = 0
    
    override init() {
      firstNode = Node()
      lastNode = Node()
    }
    
    //增
    //首节点增加
    func addNodeAtFirst(data:Int){
        
        let newNode = Node()
        newNode.data = data
        //判断是否还没有一个节点
        if size == 0{
            firstNode?.nextNode = newNode
            newNode.preNode = firstNode
            newNode.nextNode = lastNode
            lastNode?.preNode = newNode
            
        }else{
            let nextNode = firstNode?.nextNode
            firstNode?.nextNode = newNode
            newNode.nextNode = nextNode
            newNode.preNode = firstNode
            nextNode?.preNode = newNode
        }
        size = size + 1
    }
    
    //尾节点增加
    func addNodeAtLast(data:Int){
        
        let newNode = Node()
        newNode.data = data
        if size == 0{
            firstNode?.nextNode = newNode
            newNode.preNode = firstNode
            newNode.nextNode = lastNode
            lastNode?.preNode = newNode
        }else{
            
            let preNode = lastNode?.preNode
            lastNode?.preNode = newNode
            newNode.preNode = preNode
            newNode.nextNode = lastNode
            preNode?.nextNode = newNode
            
        }

        size = size + 1
    }
    
    
    //任意位置增加
    func addNode(at index : Int,_ data:Int){
        if index < 0{
           print("index必须为正数")
            return
         }
        
          if index >  size - 1 ||  size == 0  {
              print("index超出或等于长度或长度为0，直接在尾部添加")
              self.addNodeAtLast(data: data)
              return
          }
          
          if index == 0  {
              print("index为0，直接在首部添加")
              self.addNodeAtFirst(data: data)
              return
          }
        
    
        let newNode = Node()
        newNode.data = data
        //如果位置在前半部分则从前面遍历插入，反之则从后面遍历插入
        let isFirstBegin = index < size/2+1 ? true : false
        var curNode = isFirstBegin ? firstNode : lastNode
        for i in 0 ..< size{
             curNode = isFirstBegin ? curNode?.nextNode : curNode?.preNode
             let searchIndex = isFirstBegin ? index :  (size - index) - 1
             if i == searchIndex  {
                 let preNode = curNode?.preNode
                 curNode?.preNode = newNode
                 newNode.nextNode = curNode
                 preNode?.nextNode = newNode
                 newNode.preNode = preNode
                 size = size + 1
                return
             }
        }
    }
    
    //删
    //删除第一个节点
    func removeNodeFirst() {

        //判断是否还没有一个节点
        if size == 0{
            return
        }
        
        if size == 1{
          firstNode?.nextNode = nil
           size = 0
          return
        }
   
        let nextNextNode = firstNode?.nextNode?.nextNode
        firstNode?.nextNode = nextNextNode
        nextNextNode?.preNode = firstNode
        
        
        size = size - 1
    }
    
    
    //删除最后一个节点
    func removeNodeLast() {

        //判断是否还没有一个节点
        if size == 0{
            return
        }
        
        if size == 1 {
           firstNode?.nextNode = nil
            lastNode?.preNode = nil
            size = 0
           return
        }
        
        let prePreNode = lastNode?.preNode?.preNode
        prePreNode?.nextNode = lastNode
        lastNode?.preNode = prePreNode
        
        size = size - 1
      
    }
    
    //删除任意位置节点
    func removeNode(at index : Int) {
 
        //判断是否还没有一个节点
        if size == 0 || index < 0 { return }
        
        //删第一个
        if index == 0 ||  size == 1{
          self.removeNodeFirst()
          return
        }
        
        //删最后一个
        if index >= size - 1{
            print("index大于长度删除最后一个")
            self.removeNodeLast()
            return
        }
        
        //如果位置在前半部分则从前面遍历删除，反之则从后面遍历删除
        let isFirstBegin = index < size/2+1 ? true : false
        var curNode = isFirstBegin ? firstNode : lastNode
        for i in 0 ..< size{
            curNode = isFirstBegin ? curNode?.nextNode : curNode?.preNode
            let searchIndex = isFirstBegin ? index :  (size - index) - 1
            if i == searchIndex  {
                let nextNode = curNode?.nextNode
                let preNode = curNode?.preNode
                preNode?.nextNode = nextNode
                nextNode?.preNode = preNode
                size = size - 1
                return
            }
       }
    }
    
    //删除所有节点
    func removeAll(){
        firstNode?.nextNode = nil
        lastNode?.preNode = nil
        size = 0
    }
    
    //改
    func upadteNode(at index : Int , _ data : Int) {

        if index < 0 || index > size - 1  {
            print("index必须为正数且不能超过NodeList长度")
            return
        }
    
         let isFirstBegin = index < size/2+1 ? true : false
         var curNode = isFirstBegin ? firstNode : lastNode
         for i in 0 ..< size{
             curNode = isFirstBegin ? curNode?.nextNode : curNode?.preNode
             let searchIndex = isFirstBegin ? index :  (size - index) - 1
             if i == searchIndex  {
                curNode?.data = data
                return
             }
        }
    }
    
    
    //查
    func getIndexNode(_ index : Int) -> (Node?) {
        
        if index < 0 || index > size - 1 {
          print("index必须为正数且不能超过NodeList长度")
           return nil
        }
        
        if index > size - 1{
            print("查找位置已超过NodeList的长度")
            
        }else{
            
            let isFirstBegin = index < size/2+1 ? true : false
             var curNode = isFirstBegin ? firstNode : lastNode
             for i in 0 ..< size{
                 curNode = isFirstBegin ? curNode?.nextNode : curNode?.preNode
                 let searchIndex = isFirstBegin ? index :  (size - index) - 1
                 if i == searchIndex  {
                    return curNode
                 }
            }
        }
        
         return nil
     }
    
    //链表长度
    func getNodeLength() -> (Int) {
       
        return size
//        var count = 0
//        var node = firstNode
//        while node?.nextNode != nil {
//            node = node?.nextNode
//            count = count + 1
//        }
//        return count
    }
}


