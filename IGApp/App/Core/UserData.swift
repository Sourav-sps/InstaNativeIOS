//
//  UserData.swift
//  IGApp
//
//  Created by Softprodigy on 18/04/24.
//

import Foundation


struct UserData:  Hashable,Identifiable, Codable{
    var id: String
    var name:String
    var image:String?
    var email:String?
    var post:Int?
    var followers:Int?
    var following:Int?
    var hasVerified:Bool?
}
