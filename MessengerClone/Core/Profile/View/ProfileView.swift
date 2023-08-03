//
//  ProfileView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-07-31.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user : User
    
    var body: some View {
        VStack {
            // Header
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray4))
                            .clipShape(Circle())
                        
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // List
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log Out") {
                        AuthService.shared.signOut()
                    }
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.Mock_User)
    }
}
