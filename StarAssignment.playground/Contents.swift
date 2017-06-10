//: Playground - noun: a place where people can play

import UIKit

var range1 = 1...5

print("print forward stars")
// print forward stars
for rangingVariable in range1 {
    var str = ""
    
    var numberOfStarsInRow = 0
    var stringOfStars = ""
    while numberOfStarsInRow < rangingVariable {
        stringOfStars.append("*")
        numberOfStarsInRow += 1
    }
    print (stringOfStars)

}

print()

print("print reverse stars")
// print reverse stars


for rangingVariable in range1.reversed(){
    var str = ""
    
    var numberOfStarsInRow = 0
    var stringOfStars = ""
    while numberOfStarsInRow < rangingVariable {
        stringOfStars.append("*")
        numberOfStarsInRow += 1
    }
    print (stringOfStars)
    
}


