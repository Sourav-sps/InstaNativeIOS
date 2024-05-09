//
//  EditProfileView.swift
//  IGApp
//
//  Created by Softprodigy on 07/05/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage:PhotosPickerItem?
    @StateObject private var viewModel: EditProfileViewModel
    
    init(user:UserData) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                })
                Spacer()
                Text("Edit Profile")
                Spacer()
                Button(action: {
                    Task{try await viewModel.updateProfile()}
                }, label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                })
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical)
            VStack{
                PhotosPicker(selection:$viewModel.selectedImage){
                    if let image = viewModel.image{
                        image
                            .resizable()
                            .foregroundColor(.black)
                            .background(.gray)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }else{
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.black)
                            .background(.gray)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                }
                Text("Edit or remove")
                
                Divider()
                    .padding(.vertical)
                EditProfileViewRow(title: "Name", placeholder:"Enter name", value: $viewModel.name)
                EditProfileViewRow(title: "Emai", placeholder:"Enter Email",disabled: true, value: $viewModel.email)
                EditProfileViewRow(title: "Bio", placeholder:"Enter Bio", value: $viewModel.bio)
               
            }
            
            Spacer()
            
        }
    }
}

struct EditProfileViewRow:View{
    let title:String
    let placeholder:String
    var disabled = false
    @Binding var value:String
    var body:some View{
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
               
            
            VStack{
                TextField(placeholder, text: $value)
                    .disabled(disabled)
                Divider()
            }
                
        }
        .font(.body)
        .fontWeight(.semibold)
        .foregroundColor(Color(.black).opacity(0.9))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: userData[0])
    }
}
