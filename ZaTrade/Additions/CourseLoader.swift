//
//  Currency.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 20.11.2020.
//

import Foundation

class CourseLoader {
    
    private let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=d8e8df647b98401cba1124ffcb0246db")
    
    public func loadArray(completionBlock: @escaping ([Course]) -> Void) -> Void {  
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard let dataResponse = data,
                      error == nil else {
                      print(error?.localizedDescription ?? "Response Error")
                      return }  
                do { 
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                                           dataResponse, options: []) as? NSDictionary
                    
                    if let rates = jsonResponse?["rates"] as? NSDictionary {
                        var currencies: [Course] = []
                        for item in rates {
                            let curr = Course(key: item.key as? String ?? "", value: item.value as? Double ?? 0.0)
                            currencies.append(curr)
                        }
                        completionBlock(currencies)
                    }

                 } catch let parsingError {
                    print("Error", parsingError) 
                 }
        })
        dataTask.resume()
    }

    public func loadSingle(currency: String, completionBlock: @escaping (Course) -> Void) -> Void {
        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard let dataResponse = data,
                      error == nil else {
                      print(error?.localizedDescription ?? "Response Error")
                      return }  
                do { 
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                                           dataResponse, options: []) as? NSDictionary
                    
                    if let rates = jsonResponse?["rates"] as? NSDictionary {
                        for item in rates {
                            if item.key as! String == currency {
                                let curr = Course(key: item.key as? String ?? "", value: item.value as? Double ?? 0.0)
                                completionBlock(curr)
                            }
                        }
                    }

                 } catch let parsingError {
                    print("Error", parsingError) 
                 }
        })
        dataTask.resume()
    }
    
}

public struct Course {
    var key: String = ""
    var value: Double = 0.0
}
