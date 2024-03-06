import Cocoa

import Foundation




public struct LinkedList<T> {
    
    class LinkedListNode {
        var value : T
        var next : LinkedListNode?
        
        init(value: T, next: LinkedListNode? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    typealias ListNode = LinkedList<T>.LinkedListNode
    var head: ListNode?
   
    
    mutating func addEnd(val: T) {
        if head == nil {
            head = ListNode(value: val)
            return
        }
        var ptr : ListNode? = head
        while ptr?.next != nil {
            ptr = ptr?.next
        }
        ptr?.next = ListNode(value:val)
    }
    
    mutating func reverse(){
        var prev : ListNode?
        var curr = head
        while curr != nil {
            var next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        head = prev
    }
    
    func printList(){
        var ptr : ListNode? = head
        while ptr != nil {
            if let _ = ptr?.next {
                print(" \(ptr!.value) ->", terminator: "")
            } else {
                print(" \(ptr!.value)")
            }
            ptr = ptr?.next
        }
    }
}

var ll = LinkedList<Int>()
ll.addEnd(val: 1)
ll.addEnd(val: 2)
ll.addEnd(val: 3)
ll.addEnd(val: 4)
ll.addEnd(val: 5)
ll.printList()

ll.reverse()
ll.printList()

