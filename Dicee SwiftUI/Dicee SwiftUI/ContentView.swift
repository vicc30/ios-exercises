//
//  ContentView.swift
//  Dicee SwiftUI
//
//  Created by Victor Cruz Galindo on 03/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        Image("background")
          .resizable()
          .edgesIgnoringSafeArea(.all)

        VStack {
          Image("diceeLogo")

          Spacer()

          HStack {
            DiceView(num: 1)
            DiceView(num: 4)
          }
          .padding(.horizontal)

          Spacer()

          Button {
            // Action
          } label: {
            Text("Roll")
              .font(.system(size: 50))
              .fontWeight(.heavy)
              .foregroundColor(.white)
              .padding(.horizontal)
          }
          .background(Color.red)

          Spacer()

        }
      }
    }
}

struct DiceView: View {

  let num: Int

  var body: some View {
    Image("dice\(num)")
      .resizable()
      .aspectRatio(1, contentMode: .fit)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


