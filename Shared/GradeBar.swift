//
//  GradeBar.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct GradeBar: View {
    var grade: Double
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red,.green]), startPoint: .leading, endPoint: .trailing)
                .cornerRadius(50)
                .frame(width: 150, height: 5).padding(0)
            HStack {
                //Spacer(minLength: 0)
                Image(systemName: "star.fill").resizable().frame(width: 15, height: 15)
                Spacer(minLength: 150)
            }.padding(0)
        }
    }
}

struct GradeBar_Previews: PreviewProvider {
    static var previews: some View {
        GradeBar(grade: 75.0)
        .previewLayout(.fixed(width: 70, height: 5))
    }
}
