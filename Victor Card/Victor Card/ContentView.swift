//
//  ContentView.swift
//  Victor Card
//
//  Created by Victor Cruz Galindo on 02/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

      ZStack {

        Color(red: 0.09, green: 0.63, blue: 0.52)
          .edgesIgnoringSafeArea(.all)

        VStack {

          Image("Victor")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle()
                      .stroke(Color.white, lineWidth: 5))


          Text("Victor Cruz")
            .font(Font.custom("Pacifico-Regular", size: 40))
            .bold()
            .foregroundColor(.white)

          Text("iOS Developer")
            .foregroundColor(.white)
            .font(.system(size: 20))

          Divider()

          InfoView(text: "55 5555 5555", imageName: "phone.fill")
          InfoView(text: "victor@mail.com", imageName: "envelope.fill")
        }


      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

