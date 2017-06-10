//: Playground - noun: a place where people can play

import UIKit

func myFunction() {
    print("this is my function")
}

func myNewFunction(data : String) {
    
    print("Data: \(data)")
}

func myNewFunction(newData : String) {
    print("Data: \(newData)")
}

func abcd(_ param : Int) {
    print("\(param)")
}

func xyz() -> String {
    return "Some String"
}


myNewFunction(newData: "ABCD")

myNewFunction(data: "Codekul")

abcd(23)

xyz()

myFunction()




func addition(_ a: Int, _ b: Int) -> Int{
    return a+b
}

func subtraction(_ a: Int, _ b: Int) -> Int{
    return a-b
}

func multiplication(_ a: Int, _ b: Int) -> Int{
    return a*b
}

func division(_ a: Int, _ b: Int) -> Int{
    return a/b
}


func factorial(_ param: Int) -> Int{
    
    if(param==1 || param==0)
    {
        return param
    }
    
    var result = 1
    var number = param
    while number > 0 {
        result *= number
        number -= 1
    }
    
    return result
}


// calculate ((10+20)*30/90 - 5) * 5

print("calculation : \(multiplication(subtraction(division(multiplication(addition(10,20),30),90),5),5))")


print("factorial : \(factorial(3))")
print("factorial : \(factorial(0))")
print("factorial : \(factorial(1))")





