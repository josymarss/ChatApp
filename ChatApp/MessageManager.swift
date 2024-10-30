//
//  Messagemanager.swift
//  ChatApp
//
//  Created by Josymarss on 30/10/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }

    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapShot, error in
            guard let documents = querySnapShot?.documents else {
                print("Error fecting documents \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch{
                    print("Error decoding data")
                    return nil
                }
            }
            
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id {
                self.lastId = id
            }

        }
    }
    
    func sendMessage(text: String) {
        let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
        
        do {
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("An error occured while sending the data")
        }
    }
    
    
}
