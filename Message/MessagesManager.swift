//
//  MessagesManager.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 8.10.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI


class MessagesManager : ObservableObject {
        @Published var randomNumber = "1234"
        @Published private(set) var messages: [Message] = []
        @Published private(set) var lastMessageId = ""
    
        let db = Firestore.firestore()
    
    init() {
        getMessages()
        
    }
            
    func getMessages() {
        db.collection("roomcode:\(randomNumber)").addSnapshotListener { querySnapshot, error in
            
  
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            

            self.messages = documents.compactMap { document -> Message? in
                do {
        
                    return try document.data(as: Message.self)
                } catch {
      
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            // Sorting the messages by sent date
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            // Getting the ID of the last message so we automatically scroll to it in ContentView
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
           do {
              
               let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
               
               try db.collection("roomcode:\(randomNumber)").document().setData(from: newMessage)
               
           } catch {
  
               print("Error adding message to Firestore: \(error)")
           }
       }
    
}
