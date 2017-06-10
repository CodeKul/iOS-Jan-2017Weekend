//: Playground - noun: a place where people can play

import UIKit

var currentTimeStamp = Date().timeIntervalSince1970

print(currentTimeStamp)



var expiryTime = currentTimeStamp - Double(2590007 - 30)

print(expiryTime)

if(Date().timeIntervalSince1970 > expiryTime)
{
    print("expired")
}else{
    print("valid")
}

