//
//  CircularProfileView.swift
//  IGApp
//
//  Created by Softprodigy on 08/05/24.
//

import SwiftUI
import Kingfisher

struct CircularProfileView: View {
     let user:UserData
    private let frameSize:CGFloat?
    init(smallImage:Bool, user:UserData){
        self.user = user
        self.frameSize  = smallImage ? 30 : 80
    }
    
    var body: some View {
        if let profileImage = user.profileImage{
            KFImage(URL(string: profileImage))
                .resizable()
                .frame(width: frameSize, height: frameSize)
                .scaledToFill()
                .clipShape(Circle())
        }else{
            Image("profile-1")
                .resizable()
                .frame(width: frameSize, height: frameSize)
                .clipShape(Circle())
        }
    }
}

struct CircularProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileView(smallImage: false, user: userData[0])
    }
}
