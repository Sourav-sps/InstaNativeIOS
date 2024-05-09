//
//  EditProfileViewModel.swift
//  IGApp
//
//  Created by Softprodigy on 08/05/24.
//


import Foundation
import PhotosUI
import SwiftUI
import FirebaseFirestore

@MainActor
class EditProfileViewModel: ObservableObject{
    
    @Published var user:UserData
    @Published var image:Image?
    @Published var name = ""
    @Published var bio = ""
    @Published var email = ""
    private var uiImage:UIImage?
    
    init(user:UserData) {
        self.user = user
        
        self.name = user.name
        self.bio = user.bio!
        self.email = user.email!
    }
    
    @Published var selectedImage:PhotosPickerItem?{
        didSet { Task {await loadItem(fromItem: selectedImage)}}
    }
    func loadItem(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else {return}
        self.uiImage =  uiImage
        self.image = Image(uiImage:uiImage)
    }
    
    
    func updateProfile() async throws{
        var data = [String:Any]()
        
        
        if let uiImage = uiImage{
           let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImage"] = imageUrl
        }
        
        if !name.isEmpty && name != user.name{
            data["name"] = name
        }
        if !bio.isEmpty && bio != user.bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
