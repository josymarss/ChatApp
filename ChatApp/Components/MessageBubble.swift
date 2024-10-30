//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Josymarss on 29/10/24.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State var showDate = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
                    
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showDate.toggle()
            }
            
            if showDate {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "123", text: "Being a master on SwiftUI and Firebase with FireStore", received: false, timestamp: Date()))
    }
}
