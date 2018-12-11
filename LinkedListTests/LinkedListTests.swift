//
//  Linked_ListTests.swift
//  Linked ListTests
//
//  Created by Brian Green on 12/6/18.
//  Copyright © 2018 Brian Green. All rights reserved.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    func testInsert(){
        let linkedList = LinkedList()
        linkedList.insert(21)
        assert(linkedList.head?.value == 21 )
    }
    
    func testOrderedInsert(){
        let linkedList = LinkedList()
        linkedList.insert(3)
        linkedList.insert(4)
        linkedList.insert(5)
        linkedList.insertInOrder(2)
        assert(linkedList.head?.value == 2)
    }
    
    func testIndex(){
        let linkedList = LinkedList()
        linkedList.insert(1)
        linkedList.insert(2)
        linkedList.insert(4)
        linkedList.insertInOrder(3)
        assert(linkedList.nodeAt(2)?.value == 3)
    }
    
    func testDelete(){
        let linkedList = LinkedList()
        linkedList.insert(1)
        linkedList.insert(2)
        linkedList.insert(3)
        linkedList.delete(value: 1)
        assert(linkedList.head?.value == 2)
    }
    


}
