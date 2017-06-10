//: Playground - noun: a place where people can play

import UIKit


//Arrays

var arr = [1.0,2,3,4,5]

var newArr1 : Array<String>

var a = 10.8

a = arr[4]

newArr1 = Array(arrayLiteral : "qwe", "rty")

var newArr2 = Array(arrayLiteral: "abc", "xyz")


var newArr3 = newArr1 + newArr2

newArr3.append("jkl")

newArr3.append(contentsOf: newArr1)

newArr3.count

newArr3.reverse()



//Dictionaries


var dict = Dictionary<Int, Any>()

dict.updateValue("Codekul", forKey: 12)

dict.updateValue(12, forKey: 11)

dict[35] = "35"

dict[11]

dict[12]


var newDict = Dictionary<Int, Any>()


newDict[22] = dict


newDict = [1 : "one", 2 : "two"]

newDict





//  Check functions on arrays and dictionaries

var integerArray = [1,2,3,]
integerArray.append(contentsOf: integerArray)
integerArray.append(contentsOf: 4...6)
integerArray.append(7)
integerArray.capacity    // what does capacity do ?

integerArray.count

integerArray.customMirror   // what does mirroring mean ?


integerArray.debugDescription

integerArray.distance(from: 1, to: 7)
integerArray.endIndex

integerArray.formIndex(after: &integerArray[7])

integerArray.formIndex(before: &integerArray[5])


integerArray.index(before: 6)









var stringArray = ["Swift", "i10", "i20", "fabia", "figo"]

var dictionaryObject = Dictionary<Int, Any>()













