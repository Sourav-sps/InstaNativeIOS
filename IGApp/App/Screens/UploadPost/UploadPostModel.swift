//
//  UploadPostModel.swift
//  IGApp
//
//  Created by Softprodigy on 01/05/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostModel: ObservableObject{
    
    @Published var image:Image?
    @Published var selectedImage:PhotosPickerItem?{
        didSet { Task {await loadItem(fromItem: selectedImage)}}
    }
    func loadItem(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:data) else {return}
        self.image = Image(uiImage:uiImage)
    }
}
