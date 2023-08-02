//
//  ChatView.swift
//  MessengerClone
//
//  Created by Gytis Ptašinskas on 2023-08-02.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    var body: some View {
        VStack {
            ScrollView {
                // Header
                VStack {
                    CircularProfileImageView(user: User.Mock_User, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text("Tony Stark")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(Color(.gray))
                    }
                }
                
                // Messages
                ForEach(0 ... 15, id: \.self) { meesage in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }

            }
            
            // Message input view
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button {
                    print("Send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)

            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}