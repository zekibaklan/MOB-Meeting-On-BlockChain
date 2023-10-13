//
//  FirestoreDeneme.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 9.10.2023.
//

import SwiftUI
import Solana

struct FirestoreDeneme: View {
    @StateObject var messagesManager = MessagesManager()
    @ObservedObject private var fireStoreModel = FirestoreModel()
    @Binding var walletPublicKey: PublicKey?
    
    var body: some View {
        NavigationView {
                
            VStack(alignment : .leading,spacing: 8) {
            
                    if let fsData = fireStoreModel.fireStoreData {
                        Text("Room Code: \(fsData.roomCode)")
                        Text("Event Date: \(fsData.eventDate.formatted(date: .abbreviated, time: .shortened))")
                        HStack {
                            Text("Creator Publickey: \(fsData.createrPublickey)".prefix(23))
                            Text("****")
                            Text("\(fsData.createrPublickey)".suffix(4))
                        }
                        
                        
                    } else {
                        Text("Veri yükleniyor...")
                    }
                    
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(messagesManager.messages, id: \.id) {
                                message in
                                MessageBubble(walletPublicKey: $walletPublicKey, message: message)
                            }
                        }//:SCROLL VIEW
                        
                        .background(Color("Colorblack"))
                        .ignoresSafeArea(.all)
                        .padding(.top,4)
                        
                        .onChange(of: messagesManager.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id,anchor: .bottom)
                            }
                            
                            
                        }
                    }//:SCROLLVIEWREADER
                }//:VSTACK
            
            .navigationTitle(fireStoreModel.fireStoreData?.eventTitle ?? "--")
                .navigationBarTitleDisplayMode(.automatic)
                .lineLimit(2)
                .onAppear() {
                    self.fireStoreModel.fetchData()
                }
                
                
            }//:NAVIGATION
            
            MessageField().environmentObject(messagesManager)
            
            
            
        }
        
        
    }



#Preview {
    FirestoreDeneme( walletPublicKey: .constant(nil))
}
