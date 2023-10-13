//
//  AppDelegate.swift
//  PhantomConnectExample
//
//  Created by Zeki Baklan on 7.10.2023.
//

import SwiftUI


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
     
    return true
  }
}
