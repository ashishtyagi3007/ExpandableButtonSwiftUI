//
//  ContentView.swift
//  ExpandableButtonSwiftUI
//
//  Created by Ashish Tyagi on 07/10/20.
//  Copyright © 2020 Ashish Tyagi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    @State private var alertLabel: String = ""

    
    var body: some View {
      NavigationView {
        ZStack {
          // List
          List(1...20, id: \.self) { i in
            Text("Item \(i)")
              .padding()
          }

          VStack {
            Spacer()
            HStack {
              Spacer()
              ExpandableButtonPanel(
                primaryItem: ExpandableButtonItem(label: "➕"),
                secondaryItems: [
                  ExpandableButtonItem(label: "🌞") {
                    self.alertLabel = "🌞"
                    self.showAlert.toggle()
                  },
                  ExpandableButtonItem(label: "🥑") {
                    self.alertLabel = "🥑"
                    self.showAlert.toggle()
                  }
                    
                ]
              )
              .padding()
            }
          }
        }
        .alert(isPresented: $showAlert) {
          return Alert(title: Text("You selected \(self.alertLabel)"))
        }
        .navigationBarTitle("Numbers")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
