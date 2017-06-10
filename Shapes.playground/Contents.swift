//: Playground - noun: a place where people can play

import UIKit


class Shapes{
    var area = 0.0
    var shapeName : String
    
    init(shapeName : String){
        self.shapeName = shapeName
    }
    
    func calculateArea(){
        
    }
    
    func displayArea(){
        print("Area of \(self.shapeName) : \(self.area)")
        
    }
    
}


class rightTriangle : Shapes{
    
    var base : Double
    var height : Double
    
    init(base : Double, height : Double, shapeName :String){
        self.base = base
        self.height = height
        super.init(shapeName: shapeName)
    }
    
    override func calculateArea() {
        self.area = 1/2 * self.base * self.height
    }
}

class Circle : Shapes {
    var radius : Double
    
    init(radius : Double, shapeName: String){
        self.radius = radius
        super.init(shapeName: shapeName)
    }
    
    override func calculateArea() {
        self.area = 3.14 * self.radius * self.radius
    }
}

class Rectangle : Shapes {
    var length : Double
    var breadth : Double
    
    init(length : Double, breadth : Double, shapeName : String){
        self.length = length
        self.breadth = breadth
        
        super.init(shapeName: shapeName)
    }
    
    override func calculateArea() {
        self.area = self.length * self.breadth
    }
}


class Square : Rectangle {
    var side : Double
    
    init(side : Double, shapeName : String) {
        self.side = side
        super.init(length: self.side, breadth: self.side, shapeName: shapeName)
    }
}


var rightTriangleObj = rightTriangle(base: 3.0, height: 4.0, shapeName : "Triangle")
rightTriangleObj.calculateArea()
rightTriangleObj.displayArea()


var circleObj = Circle(radius: 7.0, shapeName : "Circle")
circleObj.calculateArea()
circleObj.displayArea()

var rectObj = Rectangle(length: 7.5, breadth: 5.8, shapeName : "Rectangle")
rectObj.calculateArea()
rectObj.displayArea()

var sqrObj = Square(side: 1.92, shapeName : "Square")
sqrObj.calculateArea()
sqrObj.displayArea()






