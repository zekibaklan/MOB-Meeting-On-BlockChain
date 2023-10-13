//
//  Message.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 8.10.2023.
//

import Foundation
import Solana

struct Message : Identifiable ,Codable {

    
    var id : String
    var text : String
    var received : Bool 
    var timestamp : Date 

    
    
}
