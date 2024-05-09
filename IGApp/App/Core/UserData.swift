//
//  UserData.swift
//  IGApp
//
//  Created by Softprodigy on 18/04/24.
//

import Foundation
import FirebaseAuth

struct UserData:  Hashable,Identifiable, Codable{
    var id: String
    var name:String
    var profileImage:String?
    var email:String?
    var post:Int?
    var followers:Int?
    var following:Int?
    var hasVerified:Bool?
    var bio:String?
    
    var isLoggedUser:Bool{
        guard let currentUserId = Auth.auth().currentUser?.uid else {return false}
        return currentUserId == id
    }
}


let userData:[UserData] = [
    .init(id:NSUUID().uuidString,name: "John Doe",profileImage: nil, bio: ""),
    .init(id:NSUUID().uuidString,name: "Tina D'crouz",profileImage: nil, bio: ""),
    .init(id:NSUUID().uuidString,name: "Akhilesh Singh",profileImage: nil, bio: ""
         )
]
