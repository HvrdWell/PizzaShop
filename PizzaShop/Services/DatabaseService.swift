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
    
    private init ( ) { }
    //
    func setProfile(user: MUser, completion: @escaping (Result<MUser, Error>) -> (Void)){
        usersRef.document(user.id).setData(user.representation){ error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
    }
    func getProfile (completion: @escaping (Result<MUser, Error> )  -> ( )){
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
