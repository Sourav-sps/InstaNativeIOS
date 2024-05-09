//
//  ImageUploader.swift
//  IGApp
//
//  Created by Softprodigy on 08/05/24.
//

import UIKit
import FirebaseStorage

class ImageUploader{
    static func uploadImage(image:UIImage) async throws-> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.6) else {return nil}
        let imageName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(imageName)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let path = try await ref.downloadURL()
            return path.absoluteString
    
        }catch{
            print("error in uploading image\(error.localizedDescription)")
            return nil
        }
        
    }
}
