//
//  Note.swift
//  Swifty Notes WatchKit Extension
//
//  Created by Matthew Sakhnenko on 03.01.2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String 
}
