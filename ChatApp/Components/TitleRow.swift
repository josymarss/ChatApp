//
//  TileRow.swift
//  ChatApp
//
//  Created by Josymarss on 29/10/24.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://plus.unsplash.com/premium_photo-1683140621573-233422bfc7f1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D")
    
    var name = "Jane Smith"
    
    var body: some View {
        HStack{
            AsyncImage(url: imageUrl){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height: 50)
                    .cornerRadius(50)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Image(systemName: "phone.fill")
                    .foregroundColor(.gray)
            }
            .padding(10)
            .background(.white)
            .cornerRadius(50)
            .frame(width:50, height: 50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
