//
//  SettingsView.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var value: Double = 1
    
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(Int(value))".uppercased())
                .fontWeight(.bold)
            
            Slider(value: $value, in: 1...4, step: 1) { value in 
                save()
            }
                .accentColor(.accentColor)
        }
    }
    
    //MARK: - Functions
    
    func save() {
        UserDefaults.standard.set(Int(value), forKey: "lineCount")
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
