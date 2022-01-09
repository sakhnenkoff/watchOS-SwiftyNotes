//
//  DetailView.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Property
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    let note: Note
    let count: Int
    let index: Int
    
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // Header
            HeaderView()
            // Content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // Footer
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
            }
            .foregroundColor(.secondary)
            .sheet(isPresented: $isCreditsPresented) {
                Credits()
            }
            .sheet(isPresented: $isSettingsPresented) {
                SettingsView()
            }
            
        }
        // .vstack
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello world!")
    static var previews: some View {
        DetailView(note: sampleData , count: 5, index: 1)
    }
}
