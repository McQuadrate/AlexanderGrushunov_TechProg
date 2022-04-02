//
//  ContentView.swift
//  Calculator
//
//  Created by Владислав on 02.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var calcStr: String = ""
    @State private var lastRes: String = ""

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
