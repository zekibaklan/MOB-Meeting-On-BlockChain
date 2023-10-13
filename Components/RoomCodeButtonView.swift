//
//  CreateRoomButton.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 7.10.2023.
//

import SwiftUI

struct RoomCodeButtonView: View {
    @State private var roomCode: String = ""
    
    var body: some View {
       
        HStack {

            TextField("ROOM CODE", text: $roomCode)
            Button(action: {
                print("Button pressed")
            }, label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    
                    
                    
            
            })
            
        }
        .modifier(ButtonModifier())
    }
}

#Preview {
    RoomCodeButtonView()
}
