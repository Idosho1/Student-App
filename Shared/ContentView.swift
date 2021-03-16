//
//  ContentView.swift
//  Shared
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StudentList().preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(studentData())
    }
}
