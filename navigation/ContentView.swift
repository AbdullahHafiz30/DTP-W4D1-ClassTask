//
//  ContentView.swift
//  navigation
//
//  Created by عبدالله حافظ on 09/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode: Bool = false
    @State private var contents = [
        Content(title: "home", image: "house", description: "This is Home"),
        Content(title: "profile", image: "person.circle", description: "This is my profile"),
        Content(title: "setting", image: "gear", description: "This is Sittings"),
    ]
    
    var body: some View {
        ZStack {
            (isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea(.all)
            
            VStack {
                Toggle(isDarkMode ? "Light Mode" : "Dark Mode", isOn: $isDarkMode)
                    .foregroundColor(isDarkMode ? .white : .black)
                    .padding()
                
                Spacer()
                
                // Place your NavigationStack here so it can display the List & toolbar
                NavigationStack {
                    List {
                        // Use ForEach on the array so we can add onDelete
                        ForEach(contents) { content in
                            NavigationLink {
                                ContentDetails(content: content)
                            } label: {
                                HStack(spacing: 20) {
                                    Image(systemName: content.image)
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(isDarkMode ? .white : .black)
                                    Text(content.title)
                                        .foregroundColor(isDarkMode ? .white : .black)
                                }
                            }
                        }
                        // Swipe to delete
                        .onDelete(perform: deleteItems)
                    }
                    // button to create new items
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Add") {
                                withAnimation {
                                    contents.append(
                                        Content(
                                            title: "New Item \(contents.count + 1)",
                                            image: "star",
                                            description: "A brand new item"
                                        )
                                    )
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Delete items from the list
    private func deleteItems(at offsets: IndexSet) {
        withAnimation {
            contents.remove(atOffsets: offsets)
        }
    }
}

#Preview {
    ContentView()
}
