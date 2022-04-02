//
//  ContentView.swift
//  Calculator
//
//  Created by Владислав on 02.04.2022.
//

import SwiftUI
import AVKit

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

struct ResultView: View {
    @Binding var calcStr: String
    @Binding var lastRes: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Введенное выражение: \(lastRes)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 352, minHeight: 50, alignment: .center)
                .border(Color("Border"), width: 3)
                .background(Color("Other").opacity(0.8))
            Text(calcStr)
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 352, minHeight: 50)
                .border(Color("Border"), width: 3)
                .background(Color("Digits").opacity(0.8))
                .foregroundColor(Color("Border"))
        }
    }
}

struct CalcButtonsView: View {
    @Binding var calcStr: String
    @Binding var lastRes: String
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Button(action: {
                                buttonsLogic(buttonCode: "C", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("C")
                                    .frame(maxWidth: 88, maxHeight: 40)
                            }
                            .buttonStyle(ClearButtonBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "+", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("+")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(OtherButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "-", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("-")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(OtherButtonsBackground())
                        }
                        HStack(spacing: 0) {
                            Button(action: {
                                buttonsLogic(buttonCode: "1", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("1")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "2", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("2")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "3", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("3")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "*", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("*")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(OtherButtonsBackground())
                        }
                        HStack(spacing: 0) {
                            Button(action: {
                                buttonsLogic(buttonCode: "4", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("4")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "5", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("5")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "6", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("6")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(DigitsButtonsBackground())
                            Button(action: {
                                buttonsLogic(buttonCode: "/", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                            }) {
                                Text("/")
                                    .frame(maxWidth: 28, maxHeight: 40)
                            }
                            .buttonStyle(OtherButtonsBackground())
                        }
                        
                    }
                    Button(action: {
                        buttonsLogic(buttonCode: "⌫", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("⌫")
                            .frame(maxWidth: 80, maxHeight: 184)
                    }
                    .buttonStyle(OtherButtonsBackground())
                }
                HStack(spacing: 0) {
                    Button(action: {
                        buttonsLogic(buttonCode: "7", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("7")
                            .frame(maxWidth: 28, maxHeight: 40)
                    }
                    .buttonStyle(DigitsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: "8", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("8")
                            .frame(maxWidth: 28, maxHeight: 40)
                    }
                    .buttonStyle(DigitsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: "9", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("9")
                            .frame(maxWidth: 28, maxHeight: 40)
                    }
                    .buttonStyle(DigitsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: "=", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("=")
                            .frame(maxWidth: 140,
                            maxHeight: 40)
                    }
                    .buttonStyle(ResultButtonBackground())
                }
                HStack(spacing: 0) {
                    Button(action: {
                        buttonsLogic(buttonCode: "0", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("0")
                            .frame(maxWidth: 28, maxHeight: 40)
                    }
                    .buttonStyle(DigitsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: ".", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text(".")
                            .frame(maxWidth: 28, maxHeight: 40)
                    }
                    .buttonStyle(DigitsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: "(", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text("(")
                            .frame(maxWidth: 84, maxHeight: 40)
                    }
                    .buttonStyle(BracketsButtonsBackground())
                    Button(action: {
                        buttonsLogic(buttonCode: ")", calcStr: &calcStr, lastRes: &lastRes, audioPlayer: &self.audioPlayer)
                    }) {
                        Text(")")
                            .frame(maxWidth: 84, maxHeight: 40)
                    }
                    .buttonStyle(BracketsButtonsBackground())
                }
            }
        }
        .border(Color("Border"), width: 6)
        .onAppear {
            let sound = Bundle.main.path(forResource: "Unravel", ofType: "ghoul")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.volume = 1.0
        }
    }
}

struct CalcView: View {
    @Binding var calcStr: String
    @Binding var lastRes: String

    var body: some View {
        ZStack {
            Image("TokCalc")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                ResultView(calcStr: $calcStr, lastRes: $lastRes)
                Spacer()
                CalcButtonsView(calcStr: $calcStr, lastRes: $lastRes)
            }
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView: View {
    @State private var calcStr: String = ""
    @State private var lastRes: String = ""
    
    var body: some View {
        VStack {
            CalcView(calcStr: $calcStr, lastRes: $lastRes)
        }
        .background(Color("CalcBGColor"))
        .statusBar(hidden: true)
    }
}

func buttonsLogic(buttonCode: String, calcStr: inout String, lastRes: inout String, audioPlayer: inout AVAudioPlayer) {
    let calc = CalculatorLogic()
    
    switch buttonCode {
    case "⌫":
        if !lastRes.isEmpty {
            lastRes = ""
        }
        
        if !calcStr.isEmpty {
            calcStr.removeLast()
        }
    case "C":
        lastRes = ""
        calcStr = ""
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            audioPlayer.currentTime = 0.0
        }
    case "7":
        calcStr += buttonCode
        if calcStr == "1000-7" && !audioPlayer.isPlaying {
            audioPlayer.currentTime = 0.0
            audioPlayer.play()
        }
    case "=":
        let strCopy: String = calcStr
        let text: [Character] = Array(strCopy)
        lastRes = strCopy
        calcStr = calc.Calculate(text: text)
        
        if strCopy == "1000-7" || calcStr == "993.0" {
            audioPlayer.play()
        }
    default:
        calcStr += buttonCode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
