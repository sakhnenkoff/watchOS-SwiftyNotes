//
//  Credits.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import SwiftUI

struct Credits: View {
    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            HeaderView(title: "Credits")
            Text("Matthew Sakhnenko")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
