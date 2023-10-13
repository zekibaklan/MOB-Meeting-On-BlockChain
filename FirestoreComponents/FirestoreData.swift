//
//  FirestoreData.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 9.10.2023.
//

import Foundation

struct fsData : Identifiable {
    var id : String
    var fireStoreUid : String
    var eventTitle : String
    var eventDate : Date
    var roomCode : String
    var createrPublickey : String
}
