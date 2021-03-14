//
//  sImage.swift
//  Student App
//
//  Created by Ido Shoshani on 3/2/21.
//

import SwiftUI

struct sImage: View {
    var studentImage: Image
    var body: some View {
        studentImage.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct sImage_Previews: PreviewProvider {
    static var previews: some View {
        sImage(studentImage: Image("benPic"))
    }
}
