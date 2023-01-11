//
//  DatabaseService.swift
//  PizzaShop
//
//  Created by geka231 on 05.01.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService( )
    //ссылка на бд
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    private var ordersRef: CollectionReference{
        return db.collection("orders")
    }
    
    private init ( ) { }
    
    func gerOrders(by userID: String?, completion: @escaping (Result<[Order], Error>) -> (Void)) {
        
        self.ordersRef.getDocuments { qsnap, error in
            if let qsnap{
                var orders = [Order]( )
                for doc in qsnap.documents{
                    if let userID{
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { //Ветка админа
                        if let order = Order(doc: doc){
                            orders.append(order)
                        }
                    }
                    
                }
                completion(.success(orders))
            } else  if let error = error {
                completion(.failure(error))
            }
        }
    }

    func setOrder(order: Order, completion: @escaping (Result<Order, Error>) -> (Void) ) {
        ordersRef.document(order.id).setData(order.representation){ error in
            if let error {
                completion(.failure(error))
            } else{
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                    completion(.success(order))
                }
        }
    }
    func setPositions(to orderId: String,
                                  positions: [Position],
                                  completion: @escaping(Result<[Position], Error>) -> (Void) ) {
        
        let positionsRef = ordersRef.document(orderId).collection("positions")
        
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    

    func setProfile(user: MUser, completion: @escaping (Result<MUser, Error>) -> (Void) ) {
        usersRef.document(user.id).setData(user.representation){ error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }

  
    func getProfile (completion: @escaping (Result<MUser, Error> )  -> (Void ) ) {
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            
            guard let snap = docSnapshot else {return}
            guard let data = snap.data( ) else { return }
            guard let userName = data["name"] as? String else {return}
            guard let id = data["id"] as? String else {return}
            guard let phone = data["phone"] as? Int else {return}
            guard let address = data["address"] as? String else {return}
            
            let user = MUser (id: id, name: userName, phone: phone, address: address)

            completion(.success(user))

        }
    }
}
