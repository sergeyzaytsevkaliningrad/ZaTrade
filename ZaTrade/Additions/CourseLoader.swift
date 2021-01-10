import Foundation

final class CourseLoader {
    static let shared = CourseLoader()
    public var courses: [Course] = []
    
    
    private init() {
        loadArray(completionBlock: { data in
            self.courses = []
            for element in data {
                self.courses.append(element)
            }
        })
    }
    
    private let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=d8e8df647b98401cba1124ffcb0246db")
    
    func loadArray(completionBlock: @escaping ([Course]) -> Void) -> Void {  
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
                        self.courses = currencies
                        completionBlock(currencies)
                    }

                 } catch let parsingError {
                    print("Error", parsingError) 
                 }
        })
        dataTask.resume()
    }

    func convertToRub(currency: String, price: Double) -> Double {
        let course = calculateCourse(from: currency, to: "RUB")
        return (price * course).convertToTwo
    }
    
    func convert(from: String, to: String, price: Double) -> Double {
        let course = calculateCourse(from: from, to: to)
        return (price * course).convertToTwo
    }
    
    private func calculateCourse(from: String, to: String) -> Double {
        
        let first = findValue(name: from)
        let second = findValue(name: to)
        
        let result = second / first
        return result
    }
    
    
    private func findValue(name: String) -> Double  {
        var result: Double = 0
        for element in self.courses {
            if element.key == name {
                result = element.value
            }
        }
        return result
    }
}

public struct Course {
    var key: String = ""
    var value: Double = 0.0
}



//    private func loadSingle(currency: String, completionBlock: @escaping (Course) -> Void) -> Void {
//        let request = NSMutableURLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//            
//            guard let dataResponse = data,
//                      error == nil else {
//                      print(error?.localizedDescription ?? "Response Error")
//                      return }  
//                do { 
//                    let jsonResponse = try JSONSerialization.jsonObject(with:
//                                           dataResponse, options: []) as? NSDictionary
//                    
//                    if let rates = jsonResponse?["rates"] as? NSDictionary {
//                        for item in rates {
//                            if item.key as! String == currency {
//                                let curr = Course(key: item.key as? String ?? "", value: item.value as? Double ?? 0.0)
//                                completionBlock(curr)
//                            }
//                        }
//                    }
//
//                 } catch let parsingError {
//                    print("Error", parsingError) 
//                 }
//        })
//        dataTask.resume()
//    }
