//
//  BinaryTreeNode.swift
//  swiftProject
//
//  Created by Weike on 2020/1/20.
//  Copyright © 2020 ll. All rights reserved.
// https://www.cnblogs.com/manji/p/4903990.html
// 二叉搜索树实现

import UIKit

class BinaryTreeNode {
    /// 节点数量
    var size: Int = 0
    
    var root: TreeNode?
    
    init() { }
    
    /// 是否为空
    func isEmpty() -> Bool{
        return size == 0
    }
    
    /// 清空所有节点
    func clear(){
        root = nil
        size = 0
    }
    
    /// 增
    func add(_ node: TreeNode?){
        if node == nil {
            print("添加节点为空~")
            return
        }
        if root == nil{
            root = TreeNode(node!.val)
            size += 1
            return
        }
        
        
        // 记录添加节点的父节点
        var parent: TreeNode?
        var targetNode = root
        
        // 遍历从根节点开始，查找到node的位置，并记录它的父节点parent
        while targetNode != nil{
            parent = targetNode
            // 添加的节点值大于当前遍历节点值 , 则从右边继续遍历查找
            if node!.val > targetNode!.val{
                targetNode = targetNode!.right
          
            }else if node!.val < targetNode!.val{
                // 添加的节点值小于当前遍历节点值 , 则从左边继续遍历查找
                targetNode = targetNode!.left
                
            }else {// 相等 则覆盖
                targetNode = node
                return
            }
        }
        
        guard let parent = parent else {
            return
        }

        // 节点大于父节点值 放在右边
        if node!.val > parent.val {
            parent.right = TreeNode(node!.val)
        // 节点小于父节点值 放在左边
        }else if node!.val < parent.val{
            parent.left = TreeNode(node!.val)
        }
    }

    /// 删
    func remove(_ node: TreeNode?){
        
        
    }
    /// 节点树的高度
    func height(_ node: TreeNode?) -> Int{
       let count = node == nil ? 0 : (max(height(node!.left) , height(node!.right)) + 1)
       return count
    }
    
}
extension BinaryTreeNode {
     //[10,9,20,15,25]
    // 前序遍历(深度优先算法)
    // 根节点 -> 左子树 -> 右子树
    //10 9 7 6 8 20 15 25
    func preorderTraversal(_ rootNode: TreeNode?){
        // ===== 递归写法 =======
//        if rootNode == nil { return }
//        print("\(rootNode!.val)")
//        preorderTraversal(rootNode!.left)
//        preorderTraversal(rootNode!.right)

        // ===== 非递归写法 ========
        if rootNode == nil { return }
        let stack = StackArrayList()
        var node = rootNode
        while (!stack.isEmpty() || node != nil){
            while node != nil{
                print("\(node!.val)")
                // 加入节点： 根节点 -> 左节点 -> 右节点
                stack.push(node)
                node = node!.left
            }
            //当node == nil，stack里面有节点
            node = stack.pop()
            node = node?.right
        }
        
 
    }
    
    // 中序遍历
    // 左子树 -> 根节点 -> 右子树
    //9,10,15,20,25
    func inorderTraversal(_ rootNode: TreeNode?){
        // ===== 递归写法 =======
//        if rootNode == nil { return }
//        inorderTraversal(rootNode!.left)
//        print("\(rootNode!.val)")
//        inorderTraversal(rootNode!.right)
        
        // ===== 非递归写法 ========
        if rootNode == nil { return }
        let stack = StackArrayList()
        var node = rootNode
        while (!stack.isEmpty() || node != nil){
            while node != nil{
                stack.push(node)
                node = node!.left
            }
            node = stack.pop()
            print("\(node!.val)")
            node = node?.right
        }
        
        
    }
    
    // 后序遍历
    // 左子树 -> 右子树 -> 根节点
    //9,15,25,20,10
    //https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/er-cha-shu-de-hou-xu-bian-li-by-leetcode-solution/
    func postorderTraversal(_ rootNode: TreeNode?){
        // ===== 递归写法 =======
//        if rootNode == nil { return }
//        postorderTraversal(rootNode!.left)
//        postorderTraversal(rootNode!.right)
//        print("\(rootNode!.val)")

        // ===== 非递归写法 ========
        if rootNode == nil { return }
        if rootNode == nil { return }
        let stack = StackArrayList()
        var node = rootNode
        while (!stack.isEmpty() || node != nil){
            while node != nil{
                stack.push(node)
                node = node!.left
            }
            node = stack.pop()
            print("\(node!.val)")
            node = node?.right
        }
        
    }
    
    
    // 层序遍历
    func levelOrderTraversal(_ rootNode: TreeNode?){
        if rootNode == nil { return }
        var height = 0
        // 创建一个队列 swift没有直接使用的队列，用数组
        var queue: [TreeNode] = []
        //存储着每一层的元素数量（默认第一层root，所以值为1）
        var levelSize = 1
        // 插入到最后
        queue.append(rootNode!)
        while !queue.isEmpty {
            levelSize -= 1
            //队列不为空，取出节点
            let node = queue.removeFirst()
            print("levelOrderValue: \(node.val)")
            if node.left != nil {
                levelSize += 1
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
            
            // 将要访问下一层
            if levelSize == 0 {
                levelSize = queue.count
                height += 1
            }
        }
        print("levelOrderHeight: \(height)")
    }
}
