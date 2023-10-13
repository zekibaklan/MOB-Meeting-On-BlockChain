//
//  CreateRoomButton.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 7.10.2023.
//

import SwiftUI
import Solana

struct RoomCodeButtonView: View {
    @State private var roomCode: String = ""
    @State private var isShowingSheet: Bool = false
    @Binding var walletPublicKey: PublicKey?
    @State private var isShowingAlert: Bool = false
    var body: some View {
        
        HStack {
            
            TextField("ROOM CODE", text: $roomCode)
            
            Button(action: {
                if roomCode == "98765"{
                    isShowingSheet.toggle()
                }
                else {
                    isShowingAlert.toggle()
                }
                print("Button pressed")
            }, label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                
                
                
                
            }) .sheet(isPresented: $isShowingSheet) {
                FirestoreDeneme( walletPublicKey: $walletPublicKey)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium, .large])
            }
            
        }
        .modifier(ButtonModifier())
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("ROOM NOT FOUND"),
                message: Text("The room code you entered is not valid."),
                dismissButton: .default(Text("OK"))
            )
            
        }
    }
}

#Preview {
    RoomCodeButtonView(walletPublicKey: .constant(nil))
}
