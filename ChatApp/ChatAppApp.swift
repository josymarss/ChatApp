//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Josymarss on 29/10/24.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
