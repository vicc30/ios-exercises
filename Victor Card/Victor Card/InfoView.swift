//
//  InfoView.swift
//  Victor Card
//
//  Created by Victor Cruz Galindo on 02/06/22.
//

import SwiftUI

struct InfoView: View {

  let text: String
  let imageName: String

  var body: some View {

    RoundedRectangle(cornerRadius: 25)
      .frame(height: 50.0)
      .foregroundColor(.white)
      .overlay(
        HStack {
          Image(systemName: imageName)
            .foregroundColor(Color(red: 0.09, green: 0.63, blue: 0.52))
          Text(text)
            .foregroundColor(Color("Info Color"))
        })
      .padding()
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      InfoView(text: "56 1503 5406", imageName: "phone.fill")
        .previewLayout(.sizeThatFits)

    }
  }
}
