//
//  BinaryTreeController.swift
//  test
//
//  Created by lzwk_lanlin on 2022/1/4.
//  Copyright © 2022 Weike. All rights reserved.
//

import UIKit

class BinaryTreeController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      [10,8,20,null,null,15,25]
        let node1 = TreeNode(10)
        let node2 = TreeNode(9)
        let node6 = TreeNode(7)
        let node7 = TreeNode(8)
        let node8 = TreeNode(6)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node5 = TreeNode(25)
        let tree = BinaryTreeNode()
        tree.add(node1)
        tree.add(node2)
        tree.add(node3)
        tree.add(node4)
        tree.add(node5)
        tree.add(node6)
        tree.add(node7)
        tree.add(node8)
   
//        print("preorderTraversal: \(tree.preorderTraversal(tree.root))")
//        print("inorderTraversal: \(tree.inorderTraversal(tree.root))")
//        print("postorderTraversal: \(tree.postorderTraversal(tree.root))")
        tree.preorderTraversal(tree.root)
  

    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTs(root, minVal: Int.min, maxVal: Int.max)
    }
    
    func isValidBSTs(_ root: TreeNode? , minVal: Int , maxVal: Int) -> Bool {
        guard let root = root else {
            return true
        }
        // 每个节点如果超过这个范围，则直接返回false
        if root.val >= maxVal || root.val <= minVal {
            return false
        }
        return isValidBSTs(root.left, minVal: minVal, maxVal: root.val) && isValidBSTs(root.right, minVal: root.val, maxVal: maxVal)
    }
}
