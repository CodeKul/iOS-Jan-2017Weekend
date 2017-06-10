//: Playground - noun: a place where people can play

import UIKit

class ComplexNumbers{
    
    var real : Int
    var img : Int
    
    init(real : Int, img: Int){
        self.real = real
        self.img = img
    }
    
    func displayComplexNumberValue(){
        print("Complex Number is \(self.real)+\(self.img)i")
    }
    
    
    func additionOfComplexNumbers(myObj : ComplexNumbers){
        
        self.real += myObj.real
        self.img += myObj.img
        
        print("\nAddition Value")
        self.displayComplexNumberValue()
    }
    
    func subtractionOfComplexNumbers(myObj : ComplexNumbers){
        
        self.real -= myObj.real
        self.img -= myObj.img
        
        print("\nSubtraction Value")
        self.displayComplexNumberValue()
        
    }
    
    
    func multiplicationOfComplexNumbers(myObj : ComplexNumbers){
        
        let tempReal = self.real * myObj.real - self.img * myObj.img
        let tempImg =  self.real * myObj.img + self.img * myObj.real
        
        self.real = tempReal
        self.img = tempImg
        
        print("\n Multiplication Value")
        self.displayComplexNumberValue()
        
    }
    
}



var compObject = ComplexNumbers(real: 10, img:2)
compObject.displayComplexNumberValue()

var anotherObject = ComplexNumbers(real: 5, img: 3)
anotherObject.displayComplexNumberValue()


compObject.additionOfComplexNumbers(myObj: anotherObject)

compObject.subtractionOfComplexNumbers(myObj: anotherObject)

compObject.multiplicationOfComplexNumbers(myObj: anotherObject)





