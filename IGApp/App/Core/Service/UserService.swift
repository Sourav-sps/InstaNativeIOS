//
//  UserService.swift
//  IGApp
//
//  Created by Softprodigy on 07/05/24.
//

import Foundation
import FirebaseFirestore

class UserService {
   static func fetchAllUsers() async throws -> [UserData] {
         let snapshots = try await Firestore.firestore().collection("users").getDocuments()
    
        return snapshots.documents.compactMap({try? $0.data(as: UserData.self) })
    }
}
