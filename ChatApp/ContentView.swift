//
//  ContentView.swift
//  ChatApp
//
//  Created by Josymarss on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessageManager()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id:\.id){ message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: messagesManager.lastId) { id in
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
                
            }
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
