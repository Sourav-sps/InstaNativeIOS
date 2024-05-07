//
//  UploadView.swift
//  IGApp
//
//  Created by Softprodigy on 01/05/24.
//


import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem:PhotosPickerItem?
    @StateObject private var viewModel = UploadPostModel()
    @Binding var tabIndex:Int
    var body: some View {
        VStack{
            HStack{
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.image = nil
                    tabIndex = 0
                    
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("Upload")
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                }
            }
            .padding(.horizontal)
            HStack{
                if let image = viewModel.image{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height:80)
                        .clipped()
                        .onTapGesture {
                            imagePickerPresented.toggle()
                        }
                }
               
                
                Spacer()
                
                TextField("Enter caption...", text: $caption)
                    .autocapitalization(.none)
                    .frame(width: 260, height: 60)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
            }
            .padding(.horizontal, 24)
            
            
            Button(action: {
                
            }, label: {
                Text("Upload")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    
                    .frame(width: UIScreen.main.bounds.width-24, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                    .padding(.vertical)
                    
            })
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection:$viewModel.selectedImage)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView(tabIndex: .constant(0))
    }
}
