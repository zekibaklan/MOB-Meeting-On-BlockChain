//
//  FormView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 7.10.2023.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import PhantomConnect
import Solana

struct FormView: View {
    
    let db = Firestore.firestore()
    @State private var randomNumber = "98765"
    @State private var customToken : String = ""
    @State private var isShowingSheet: Bool = false
    @Binding var walletPublicKey: PublicKey?
    @State private var uid : String = ""
    @State private var eventTitle : String = ""
    @State var currentTime = Date()
    @State private var birthDate = Date()
    @State private var isTokenGateOn : Bool = false
    @State private var isTokenGateSelected : Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
               
                Form {
                    Section("Event title") {
                        TextField("Enter Event Title", text: $eventTitle)
                        
                    }
                    Section {
                        DatePicker("Pick a date:",selection: $currentTime,in: Date()...)
                    } header: {
                        Text("Event Time")
                    }
                    
                   
                    
                    Group {
                        Section("ROOM CODE") {
                            HStack {
                                Text(randomNumber)
                                
                                Button(action: {
                            UIPasteboard.general.string = randomNumber
                            
                            }) {
                            Image(systemName: "doc.on.doc") // Kopyalama simgesi
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .ignoresSafeArea()
                            .padding()
                            .frame(width: 50, height: 20, alignment: .center)
                            }
                           
                            .opacity(0.8)
                            }
                           
                           
                        }
                    }
                     
                      
                    
                    Section("Invitees Must Have") {
                     Toggle("NFT", isOn: $isTokenGateOn)
                        if isTokenGateOn {
                            List{
            HStack {
                VStack(alignment : .leading) {
                    Image("popularNFT1")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 5)
                    Text("Smyth #1576")
                    .font(.system(size: 10, weight: .medium, design: .rounded))  
                    .frame(alignment: .center)
                }
                .padding(.trailing,40)
              
               
                Text("DGXwf1jvrd1WnWzWvFjp7sDhiSx7QArWfLYS5dBdhSk4").lineLimit(1)
                
                Spacer()
                isTokenGateSelected ? isSelected() : nil
            }
                                  
                               
            HStack {
                VStack(alignment : .leading){
                    Image("popularNFT2")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 5)
                    Text("Jelly Rascals #2303")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                        .frame(alignment: .center)
                
                }
                .padding(.trailing,5)
                Text("6zkU7Y5tJ9dJtXt8UUth8bTq1MKzfQmHi2hJaqW8Qye2").lineLimit(1)
                                }
                                
            HStack {
                VStack(alignment : .leading) {
                    Image("popularNFT3")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                    .shadow(color: .black, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                    Text("Mad Lads #7345")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                }
                .padding(.trailing,23)
                Text("CPgE3cvxHW9dzRpaZgVKUjFkfZtoUs4ZBKaZcy5zuMow").lineLimit(1)
                                }
            HStack {
                VStack(alignment : .leading) {
                    Image("popularNFT4")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                    .shadow(color: .black, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                    Text("KING #3361")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                }
                .padding(.trailing,45)
                Text("4YZFqy4e4hBSbkJ9YxZfxtcosrsR6cZNVJrXA3LJaTVi").lineLimit(1)
                                }
            HStack {
                VStack(alignment : .leading) {
                    Image("popularNFT5")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                        .padding(.trailing,10)
                    .shadow(color: .black, radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                    Text("The Heist #14237")
                        .font(.system(size: 10, weight: .medium, design: .rounded))
                        

                }
                .padding(.trailing,23)
                Text("6zkU7Y5tJ9dJtXt8UUth8bTq1MKzfQmHi2hJaqW8Qye2").lineLimit(1)
                                }
                            }
                            .onTapGesture {
                                isTokenGateSelected.toggle()
                            }
                        }
                    }
                    Section("Custom Token") {
                        TextField("Please add here", text: $customToken)
                        
                    }

                  
                    
                
                } //: FORM
                .foregroundColor(Color("Colorwhite"))
                .navigationTitle("Create Room")
            }//: NavigaitonView
            
            Button(action: {
                storeUserInformation()
                isShowingSheet.toggle()
                print("create room button pressed")
            }, label: {
                Text("Create Room")
            })
            .modifier(ButtonModifier())
            .sheet(isPresented: $isShowingSheet) {
                FirestoreDeneme( walletPublicKey: $walletPublicKey)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
            }
            
            
            
            
        }//: ZSTACK
    
       
    }
    func storeUserInformation()
    {
       
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                print("Oturum açma hatası: \(error.localizedDescription)")
                
            }
            if let user = authResult?.user {
                uid = user.uid
              
                
            }
            db.collection("roomcode:\(randomNumber)").document(randomNumber).setData([
                "fireStoreUid" : uid,
                "eventTitle" : eventTitle,
                "eventDate" : currentTime,
                "roomCode" : randomNumber,
                "createrPublickey" : walletPublicKey?.base58EncodedString ?? "nil"
                
            ])
        }
       

        
    }
}


#Preview {
    FormView(walletPublicKey: .constant(nil))
    
}
