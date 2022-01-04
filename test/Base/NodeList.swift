//
//  NodeList.swift
//  swiftProject
//
//  Created by 兰林 on 2020/1/1.
//  Copyright © 2020 ll. All rights reserved.
// 单向链表

import UIKit

class NodeList: NSObject {
    
    private var firstNode : Node?
    
    private var size : Int = 0
    
    override init() {
      firstNode = Node()
    }
    
    //增
    //首节点增加
    func addNodeAtFirst(data:Int){
        
        let newNode = Node()
        newNode.data = data
        //判断是否还没有一个节点
        if size == 0{
            firstNode?.nextNode = newNode
            newNode.nextNode = nil
            
        }else{
            
            let nextNode = firstNode?.nextNode
            firstNode?.nextNode = newNode
            newNode.nextNode = nextNode
        }
        
        size = size + 1
    }
    
    //尾节点增加
    func addNodeAtLast(data:Int){
        
        let newNode = Node()
        newNode.data = data
        if size == 0{
            firstNode?.nextNode = newNode
            newNode.nextNode = nil
        }else{
            
            var node = firstNode
            while node?.nextNode != nil {
                node = node?.nextNode
                if node?.nextNode == nil {
                    node?.nextNode = newNode
                    newNode.nextNode = nil
                }
            }
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
          
        var curNode = firstNode
        let newNode = Node()
        newNode.data = data
    
        for i in 0 ..<  size {
            curNode = curNode?.nextNode
    
            if i == index - 1 {
                let nextNode = curNode?.nextNode
                curNode?.nextNode = newNode
                newNode.nextNode = nextNode
                
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
   
        firstNode?.nextNode = firstNode?.nextNode?.nextNode
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
            size = 0
           return
        }
        
        var node = firstNode
        for i in 0 ..< size{
            node = node?.nextNode
            
            //把最后一个的前一个nextNode为nil，最后一个就没了
            if i == size - 2  {
                node?.nextNode = nil
                size = size - 1
               
            }
        }
    }
    
    //删除任意位置节点
    func removeNode(at index : Int) {
 
        //判断是否还没有一个节点
        if size == 0{
            return
        }
        if index < 0{
            print("index必须为正数")
            return
        }

        //删第一个
        if index == 0 ||  size == 1{
          self.removeNodeFirst()
          return
        }
        
        //删最后一个
        if index > size - 1{
            print("index大于长度删除最后一个")
            self.removeNodeLast()
            return
        }
        
        var node = firstNode
        for i in 0 ..< size{
            node = node?.nextNode
           
            //把最后一个的前一个nextNode为nil，最后一个就没了
            if i == index  {
                node?.nextNode = node?.nextNode?.nextNode
                size = size - 1
                return
            }
       }
        
        
    }
    
    //删除所有节点
    func removeAll(){
        firstNode?.nextNode = nil
        size = 0
    }
    
    //改
    func upadteNode(at index : Int , _ data : Int) {

        if index < 0 || index > size - 1  {
            print("index必须为正数且不能超过NodeList长度")
            return
        }
    
        var node = firstNode
          for i in 0 ..< size{
              node = node?.nextNode
              if i == index  {
                node?.data = data
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
            var node = firstNode
               for i in 0 ... index{
                   node = node?.nextNode
                   if index == i{
                     return node
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
