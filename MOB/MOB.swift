//
//  PhantomConnectExampleApp.swift
//  PhantomConnectExample
//
//  Created by Eric McGary on 7/8/22.
//

import SwiftUI
import Firebase

@main
struct MOB: App {
   
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           ContentView()
                
        }
    }
}
