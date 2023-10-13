//
//  EventMessageView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 8.10.2023.
//

import SwiftUI
import Solana

struct MessageBubble: View {
    @Binding var walletPublicKey: PublicKey?
    var message : Message
    @State private var showtTime = false
    var body: some View {
        VStack(alignment: .center, content: {
            HStack(content: {
                Text(message.text)
                    .padding()
                    .background(Color(.gray))
                    .cornerRadius(30)
            }) //: HSTACK
            .frame(maxWidth: 300,alignment:.center)
            .onTapGesture {
                showtTime.toggle()
            }
            if showtTime {
                HStack {
                  
                    Text("\(walletPublicKey?.base58EncodedString ?? "933X")".prefix(4))
                        .foregroundStyle(.gray)
                        .font(.caption2)
                        .padding(.horizontal,5)
                        .padding(.trailing,50)
                    Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                        
             
                }
            }
        }) //: VSTACK
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom,10)
        .padding(.top,5)
        .padding(.horizontal,10)
        
        
    }
}

#Preview {
    MessageBubble(walletPublicKey: .constant(nil), message: Message(id: "12345", text: "I have been coding swiftui applications", received: false, timestamp: Date()))
}
