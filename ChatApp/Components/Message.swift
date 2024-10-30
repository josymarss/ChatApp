//
//  Message.swift
//  ChatApp
//
//  Created by Josymarss on 29/10/24.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
