import Foundation

final class TableAPI {
    
}

struct TableList: Codable {
    let table: [Table]
}

struct Table: Codable {
    var itemList = ["MacBook","Trump","Iphone","Nothing"]
    var itemListLable = ["Sold","Vote","12 mini","Well still nothig"]
    var tax = ["Tech","Not Tech"]
    var country = ["Russia", "Poland"]
    var price = [1000, 20000, 0]
}


  
