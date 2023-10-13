//
//  MessageField.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 8.10.2023.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messagesManager : MessagesManager
    
    @State private var message = ""
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
            Button(action: {
                messagesManager.sendMessage(text: message)
                message = ""
                
            }, label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Colorpurple"))
                    .cornerRadius(50)
            })
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(.gray)
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessagesManager())
}

struct CustomTextField : View {
    var placeholder: Text
    @Binding var text : String
    var editingChanged : (Bool) -> () = {_ in}
    var commit : () -> () = {}
    
    var body : some View {
        ZStack(alignment : .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text,onCommit: commit)
        }
    }
    
    
    
}
