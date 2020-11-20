//
//  Currency.swift
//  ZaTrade
//
//  Created by Константин Емельянов on 20.11.2020.
//

import Foundation

class Currency {
    
    private let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=d8e8df647b98401cba1124ffcb0246db")
    
    public func createRequest(completionBlock: @escaping ([curency]) -> Void) -> Void {  
        print("request1")

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
                        var currencies: [curency] = []
                        for item in rates {
                            let curr = curency(key: item.key as? String ?? "", value: item.value as? Double ?? 0.0)
                            currencies.append(curr)
                        }
                        completionBlock(currencies)
                        print("success")
                    }

                 } catch let parsingError {
                    print("Error", parsingError) 
                 }
        })
        dataTask.resume()
    }
}

struct curency {
    var key: String = ""
    var value: Double = 0.0
}
