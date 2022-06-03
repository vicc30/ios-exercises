//
//  ContentView.swift
//  I am Rich SwiftUI
//
//  Created by Victor Cruz Galindo on 02/06/22.
//

import SwiftUI

// User interface
struct ContentView: View {
    var body: some View {

      ZStack{
        Color(.systemTeal)
          .edgesIgnoringSafeArea(.all)
        VStack {
          Text("I am Rich").font(.system(size: 40)).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(Color.white)
          Image("diamond")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200, alignment: .center)

        }
      }

    }
}


//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}
