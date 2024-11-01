//
//  MessageField.swift
//  ChatApp
//
//  Created by Josymarss on 30/10/24.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messageManager: MessageManager
    @State private var message = ""
    
    var body: some View {
        HStack{
            CustomField(placeholder: Text("Enter Tour message here!"), text: $message)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            }label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessageManager())
    }
}

struct CustomField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in }
    var commit: () -> () = {}
    
    var body: some View {
        ZStack (alignment: .leading){
            if text.isEmpty {
                placeholder.opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
