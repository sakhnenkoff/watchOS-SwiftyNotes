//
//  HeaderView.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import SwiftUI

struct HeaderView: View {
    var title: String?
    
    var body: some View {
        VStack {
            // Title
            if let title = title {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } // .hstack
            .foregroundColor(.accentColor)
        } //. vstack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
