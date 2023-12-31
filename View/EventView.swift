//
//  MessageView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 8.10.2023.
//

import SwiftUI
import Solana

struct EventView: View {
    @StateObject var messagesManager = MessagesManager()
    @Binding var walletPublicKey: PublicKey?
    
    
    var body: some View {
        
            VStack {
            
                VStack {
                    
                  
                    HStack {
                        Text("RC : 12345")
                           
                        VStack {
                            ImageView()
                            Text("Event Title")
                            
                        }
                    
                        
                        Text("ID:\(walletPublicKey?.base58EncodedString ?? "933X")****".prefix(7))
                            
                    }
                    .font(.footnote)
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(messagesManager.messages, id: \.id) {
                                message in
                                MessageBubble(walletPublicKey: $walletPublicKey, message: message)
                            }
                        }
                       
                        .background(Color("Colorblack"))
                        .ignoresSafeArea(.all)
                        .padding(.top,10)
                  
                    .onChange(of: messagesManager.lastMessageId) { id in
                        withAnimation {
                            proxy.scrollTo(id,anchor: .bottom)
                        }
                       
                        
                    }
                    }

                }
                MessageField()
                    .environmentObject(messagesManager)
            }
            .background(Color("Colorblack"))
        
        
       
    }
}

#Preview {
    EventView(walletPublicKey: .constant(nil))
}
