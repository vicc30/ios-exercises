//
//  ContentView.swift
//  H4X0R News
//
//  Created by Victor Cruz Galindo on 03/06/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {

    NavigationView {

      List(posts) { post in
        Text(post.title)
      }
      .navigationTitle("H4X0R News")
      
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Post: Identifiable {
  let id: String
  let title: String
}

let posts = [
  Post(id: "1", title: "Hello"),
  Post(id: "2", title: "Halo"),
  Post(id: "3", title: "Hola"),
]
