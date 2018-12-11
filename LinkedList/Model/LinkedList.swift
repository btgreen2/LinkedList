//
//  LinkedList.swift
//  Linked List
//
//  Created by Brian Green on 12/6/18.
//  Copyright © 2018 Brian Green. All rights reserved.
//

import Foundation

class Node{
    let value : Int
    var next : Node?
    
    init(value : Int) {
        self.value = value
    }
}



class LinkedList{
    
    var head : Node?
    private var count = 0
    
    func getCount() -> Int{
        return count
    }
    
    //MARK: - Insert Methods
    
    func insert(_ value : Int){
        if head == nil{
            head = Node(value: value)
            count += 1
        } else{
            insertHelper(node: head, value: value)
        }
    }

    private func insertHelper(node : Node?, value : Int){
        
        if node?.next == nil{
            node?.next = Node(value: value)
            count += 1
        } else{
            insertHelper(node: node?.next, value: value)
        }
    }
    
    //MARK: - Index Methods
    
    func nodeAt(_ index : Int) -> Node?{
        return indexHelper(node: head, index: index)
    }
    
    private func indexHelper(node : Node?, index : Int) -> Node?{
        
        if node == nil{
            return nil
        }
        
        else if index == 0{
            return node
        }
        
        return indexHelper(node: node?.next, index: index - 1)

    }
    
    //MARK: - Delete Methods
    
    func delete(value : Int){
        if head?.value == value{
            head = head?.next
            count -= 1
        } else{
            deleteHelper(node: head?.next, previousNode: head, value: value)
        }
    }
    
    private func deleteHelper(node : Node?, previousNode : Node?, value : Int){
        if node?.value == value{
            previousNode?.next = node?.next
            count -= 1
        } else{
            if node?.next == nil { return }
            deleteHelper(node: node?.next, previousNode: node, value: value)
        }
    }
    
    //MARK: - Ordered Insert Methods
    
    func insertInOrder(_ value : Int){
        
        if head != nil{
            if value < head!.value{
                let newNode = Node(value: value)
                newNode.next = head
                head = newNode
                count += 1
            } else if head!.next == nil{
                let newNode = Node(value: value)
                head!.next = newNode
                count += 1
            } else{
                orderHelper(node: head!.next!, previousNode: head!, value: value)
            }
        } else{
            self.head = Node(value: value)
            count += 1
        }
        
    }
    
    private func orderHelper(node : Node, previousNode : Node, value : Int){
        if value <= node.value{
            previousNode.next = Node(value: value)
            previousNode.next?.next = node
            count += 1
        } else if node.next == nil{
            node.next = Node(value: value)
            count += 1
        } else{
            orderHelper(node: node.next!, previousNode: node, value: value)
        }
    }
    
    
    //MARK: - Print Methods
    
    func printList(){
        printHelper(node: head)
    }
    
    private func printHelper(node : Node?){
        if node != nil{
            print(node?.value as Any)
            printHelper(node: node?.next)
        }
        
    }
}
