//
//  Order.swift
//  PizzaShop
//
//  Created by geka231 on 09.01.2023.
//

import Foundation
import FirebaseFirestore
struct Order {
    var id : String = UUID().uuidString
    var userID: String
    var positions = [Position]( )
    var date: Date
    var status: String

    var cost: Int{
        var sum = 0
        for position in positions {
            sum += position.cost
        }
        return sum
    }
    var representation: [String: Any] {
         return [
             "id": id,
             "userID": userID,
             "date": Timestamp(date: Date()),
             "status": status,
         ]
     }
    init(userID: String, date: Date, status: String ){
        //var id: String = UUID().uuidString
        self.userID = userID
        //var positions = [Position]()
        self.date = date
        self.status = status

    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else {return nil}
        guard let userID = data["userID"] as? String else {return nil}
        guard let date = data["date"] as? Timestamp else {return nil}
        guard let status = data["status"] as? String else {return nil}

        
        self.id = id
        self.userID = userID
        self.date = date.dateValue()
        self.status = status
    }
}
