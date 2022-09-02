//
//  ContentView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        HistoryView()
      }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


