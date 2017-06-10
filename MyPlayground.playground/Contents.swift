 
 
 import Foundation
 import UIKit
 import CloudKit
 
 var request = URLRequest(url: URL(string: "http://www.google.com")!)
 request.httpMethod = "POST"
 let postString = ""
 request.httpBody = postString.data(using: .utf8)
 let task1 = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {                                                 // check for fundamental networking error
        print("error=\(error)")
        return
    }
    
    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
        print("statusCode should be 200, but is \(httpStatus.statusCode)")
        print("response = \(response)")
    }
    
    let responseString = String(data: data, encoding: .utf8)
    print("responseString = \(responseString)")
 }
 
 