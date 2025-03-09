//
//  ContentDetails.swift
//  navigation
//
//  Created by Abdullah Hafiz on 09/09/1446 AH.
//

import SwiftUI

struct ContentDetails: View {
    let content: Content
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: content.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(content.title)
                    .font(.largeTitle.bold())
                    .padding()
            }
            Spacer()
            Text(content.description)
        }
    }
}

#Preview {
    ContentDetails(content: .init(title: "Hello World", image: "house", description: "this is Home"))
}

