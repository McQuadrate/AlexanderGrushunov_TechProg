//
//  ContentView.swift
//  Calculator
//
//  Created by Владислав on 02.04.2022.
//

import SwiftUI

struct OtherButtonsBackground: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Other").opacity(0.8))
            .foregroundColor(.white)
            .border(Color("Border"), width: 3)
            .clipShape(Rectangle())
            .font(.system(size: 28))
    }
}

struct BracketsButtonsBackground: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Brackets").opacity(0.8))
            .foregroundColor(.white)
            .border(Color("Border"), width: 3)
            .clipShape(Rectangle())
            .font(.system(size: 28))
    }
}


struct DigitsButtonsBackground: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Digits").opacity(0.8))
            .foregroundColor(.white)
            .border(Color("Border"), width: 3)
            .clipShape(Rectangle())
            .font(.system(size: 28))
    }
}


struct ResultButtonBackground: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Result").opacity(0.8))
            .foregroundColor(.white)
            .border(Color("Border"), width: 3)
            .clipShape(Rectangle())
            .font(.system(size: 28))
    }
}


struct ClearButtonBackground: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Clear").opacity(0.8))
            .foregroundColor(.white)
            .border(Color("Border"), width: 3)
            .clipShape(Rectangle())
            .font(.system(size: 28))
    }
}

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
