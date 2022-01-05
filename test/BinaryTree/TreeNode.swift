//
//  BinaryNode.swift
//  swiftProject
//
//  Created by Weike on 2020/1/20.
//  Copyright © 2020 ll. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
           self.val = val
           self.left = left
           self.right = right
    }
}
