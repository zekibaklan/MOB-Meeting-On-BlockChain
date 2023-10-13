//
//  ProfileView.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 6.10.2023.
//

import SwiftUI
import PhantomConnect
import Solana
struct ProfileView: View {
    @StateObject private var messagesManager = MessagesManager()

    @ObservedObject var viewModel: PhantomConnectViewModel
    @Binding var walletConnected: Bool
    @Binding var walletPublicKey: PublicKey?
    @Binding var phantomEncryptionKey: PublicKey?
    @Binding var session: String?
    @Binding var transactionSignature: String?
    var body: some View {
        NavigationView {
            ZStack {
                
                
                Color("Colorblack")
                    .ignoresSafeArea(.all, edges: .all)
                
                
                VStack(spacing: 10) {
                    
                    
                    Group {
                        
                        ImageView()
                        
                        
                        
                        
                        
                    }
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    
                    
                    RowEventView()
                    RowNFTView()
                    
                    
                    Spacer()
                    HStack(alignment: .center ,spacing: 5) {
                        Spacer()
                        
                        
                        RoomCodeButtonView(walletPublicKey: $walletPublicKey)
                        Spacer()
                        NavigationLink(destination: FormView(walletPublicKey: $walletPublicKey).environmentObject(messagesManager)) { Text("Create Room")
                                .modifier(ButtonModifier())
}
    
                    }
                    
                    
                    
                    
                }
                .padding(.top)
                
            } //: VSTACK
            
            
            
        }
    }
    
    func createTransaction(completion: @escaping ((_ serializedTransaction: String) -> Void)) {
        
        let solana = Solana(router: NetworkingRouter(endpoint: RPCEndpoint.devnetSolana))
        
        solana.api.getRecentBlockhash { result in
            
            let blockhash = try? result.get()
            
            var transaction = Transaction(
                feePayer: walletPublicKey!,
                instructions: [
                    SystemProgram.transferInstruction(
                        from: walletPublicKey!,
                        to: walletPublicKey!,
                        lamports: 100
                    )
                ],
                recentBlockhash: blockhash!
            )
            
            let serializedTransaction = try? transaction.serialize().get()
            
            DispatchQueue.main.async {
                completion(Base58.encode(serializedTransaction!.bytes))
            }
            
        }
        
    }
    }


#Preview {
    ProfileView(
        viewModel: PhantomConnectViewModel(),
        walletConnected: .constant(false),
        walletPublicKey: .constant(nil),
        phantomEncryptionKey: .constant(nil),
        session: .constant(nil), transactionSignature: .constant(nil)
        
    )
}
