//: Playground - noun: a place where people can play

import UIKit

if 12 < 34 && 54 != 54 {
    
    print("True part")
}
else {
    print("False part")
}

var b1 = true

var b2 = false



if b2 {
    print("True part")
  
}
else if b1 {
    print("False part")
}


// Loops

var i = 0

while i < 10 {

    print("Codekul")
    i += 1
}

print()

i = 0
repeat {
    print("Codekul")
    i += 1
} while i < 10
print()


var range1 = 0...5
var range2 = 0..<5


for a in range1 {
    
    if a == range1.upperBound {
        break
    }
    print(a)
}

print()

for a in range2 {
    
    if a % 2 != 0 {
        continue
    }
    print(a)
}

i = 0

gameLoop: while i < 10 {

    i += 1
    switch i {
        case 5:

            break gameLoop
        case 2:
            
            continue gameLoop
        default:
            print("default")
    }
}







