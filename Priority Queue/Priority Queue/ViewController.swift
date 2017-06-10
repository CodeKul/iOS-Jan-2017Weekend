//
//  ViewController.swift
//  Priority Queue
//
//  Created by Aditya Goyal on 30/03/17.
//  Copyright © 2017 Aditya Goyal. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    
    var mainPriorityQueue : Array<Int> = []
    var constantPriorityQueue : Array<Int> = [1000,500,100,50,10]
    
    var front = -1
    
    @IBOutlet weak var displayAreaLabel: UILabel!
    @IBOutlet weak var inputQueueTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecogniser : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tapGestureRecogniser)
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func queueAValue(_ sender: UIButton) {
        
        if(self.inputQueueTextfield.text == "" || self.inputQueueTextfield.text == nil){
            print("Enter some value for textfield")
            return;
        }
        
        let valueToBeInserted = Int(self.inputQueueTextfield.text!)!
        print("valueToBeInserted : \(valueToBeInserted)")
        
        self.inputQueueTextfield.text = ""
        self.insertAValueInQueue(valueToBeInserted)
    }
    
    func insertAValueInQueue(_ valueToBeInserted : Int){
        print("insertAValueInQueue : \(valueToBeInserted)")
        
        //block the priority queue for current value to be inserted
        objc_sync_enter(self.mainPriorityQueue)
        
        if(self.front == -1 ){
            self.front = 0
        
            self.mainPriorityQueue.append(valueToBeInserted)
            
        }else{
            var isValueInserted = false
            
            for i in 0 ..< self.mainPriorityQueue.count {
                
                if(self.mainPriorityQueue[i] < valueToBeInserted){
                    self.mainPriorityQueue.insert(valueToBeInserted, at: i)
                    isValueInserted = true
                    break;
                }
            }
            
            if(!isValueInserted)
            {
                self.mainPriorityQueue.insert(valueToBeInserted, at: self.mainPriorityQueue.count)
            }
        }
        
        self.displayPriorityQueue()
        
        //release the priority queue
        objc_sync_exit(self.mainPriorityQueue)
    }
    
    
    
    @IBAction func dequeueValue(_ sender: UIButton) {
        //block the priority queue for current value to be inserted
        objc_sync_enter(self.mainPriorityQueue)
        
        if(self.front != -1)
        {
            self.mainPriorityQueue.remove(at: 0)
        }
        
        if(self.mainPriorityQueue.count == 0)
        {
            self.front = -1
        }
        
        self.displayPriorityQueue()
        
        //release the priority queue
        objc_sync_exit(self.mainPriorityQueue)

    }
    
    func displayPriorityQueue (){
        
        if(self.mainPriorityQueue.count != 0)
        {
            self.displayAreaLabel.text = "Current Priority Queue : "
            
            for i in self.mainPriorityQueue
            {
                self.displayAreaLabel.text = self.displayAreaLabel.text! + "  \(i)  "
            }
        }else{
            self.displayAreaLabel.text = "Current Priority Queue : Empty"
        }
    }
    
    @IBAction func mergeButtonPressed(_ sender: UIButton) {
        
        self.mergeTwoPriorityQueues()
        
    }
    
    func mergeTwoPriorityQueues() {
        //merging the 2 priority queues
        //merging the constant queue(self.constantPriorityQueue) in main Priority Queue
        
        objc_sync_enter(self.mainPriorityQueue)
        
        var pointerForMainQueue = self.mainPriorityQueue.count - 1
        var pointerForConstantQueue = self.constantPriorityQueue.count - 1
        
        
        // append zeroes in main priority queue for the number of elements in constant priority queue
        self.mainPriorityQueue.append(contentsOf: Array(repeating: 0, count: self.constantPriorityQueue.count))
       
        for i in (0 ... (self.mainPriorityQueue.count - 1)).reversed() {
            
            if(pointerForMainQueue >= 0 && pointerForConstantQueue >= 0) {
                if(self.constantPriorityQueue[pointerForConstantQueue]  <= self.mainPriorityQueue[pointerForMainQueue]){
                    self.mainPriorityQueue[i] = self.constantPriorityQueue[pointerForConstantQueue]
                    pointerForConstantQueue -= 1
                }else{
                    self.mainPriorityQueue[i] = self.mainPriorityQueue[pointerForMainQueue]
                    pointerForMainQueue -= 1
                }
            }
        }
        
        // Constant queue is merged. Merge remaining elements of Main Queue
        if(pointerForMainQueue > 0 && pointerForConstantQueue < 0) {
            for i in (0 ... pointerForMainQueue).reversed() {
                self.mainPriorityQueue[pointerForMainQueue] = self.mainPriorityQueue[i]
                pointerForMainQueue -= 1
            }
        }
        
        // Main queue is merged. Merge remaining elements of Constant Queue
        if(pointerForMainQueue < 0 && pointerForConstantQueue > 0) {
            for i in (0 ... pointerForConstantQueue).reversed() {
                self.mainPriorityQueue[pointerForConstantQueue] = self.constantPriorityQueue[i]
                pointerForConstantQueue -= 1
            }
        }
        
        objc_sync_exit(self.mainPriorityQueue)
        
        self.displayPriorityQueue()
    }
    
}

