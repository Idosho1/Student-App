//
//  Student_AppApp.swift
//  Shared
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

@main
struct Student_AppApp: App {
    @StateObject private var sData = studentData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sData)
        }
    }
}

