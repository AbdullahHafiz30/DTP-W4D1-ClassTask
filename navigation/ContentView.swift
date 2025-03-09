//
//  ContentView.swift
//  navigation
//
//  Created by عبدالله حافظ on 09/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isdarkmode: Bool = false
    @State private var contents = [
        Content(title: "home", image: "house"),
        Content(title: "profile", image: "person.circle"),
        Content(title: "setting", image: "gear"),
    ]
    
    var body: some View {
        Toggle( isdarkmode ? "Light Mode" :"Dark Mode", isOn: $isdarkmode).foregroundColor(isdarkmode ? Color.white : Color.black)
            .padding()
        ZStack {
            
            (isdarkmode ? Color.black : Color.white).ignoresSafeArea(.all)
            VStack {
                
                
                Spacer()
                NavigationStack{
                    List(contents) { content in
                        NavigationLink {
                            ContentDetails(content: content)
                        } label: {
                            HStack(spacing: 20){
                                Image(systemName: content.image)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(isdarkmode ? Color.white : Color.black)
                                Text(content.title)
                                    .foregroundColor(isdarkmode ? Color.white : Color.black)
                            }
                        }
                        
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
