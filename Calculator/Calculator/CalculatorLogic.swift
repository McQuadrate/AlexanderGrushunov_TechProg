//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Владислав on 02.04.2022.
//

import Foundation

class CalculatorLogic {
    var flag: Int = -1
    var divisionErrorFlag: Bool = false

    func C_in_S(c: Character, text: [Character]) -> Bool {
      for i in 0..<text.count {
        if c == text[i] {
          return true
        }
      }
      return false
    }

    func Find_Char_In_Vec(c: Character, vec: [Character]) -> Int {
      for i in stride(from: vec.count - 1, to: -1, by: -1) {
        if c == vec[i] {
          return i
        }
      }
      return -1
    }

    func Pr_Vec(vec: [Character]) {
      for i in 0..<vec.count {
        print(vec[i])
      }
    }

    func check_text(text: [Character]) -> Bool {
      let n: Int = text.count
      if n > 0 {
        var CountOpen: Int = 0
        var CountClose: Int = 0
        let operations: [Character] = ["+", "-", "*", "/"]
        let AfterOpen: [Character] = ["+", "*", "/"]
        var CheckStack: [Character] = []

        if (text[0] != "-" && C_in_S(c: text[0], text: operations))
          || C_in_S(c: text[n - 1], text: operations) || (text[0] == ")") || (text[n - 1] == "(") {
          return false
        }

        for i in 0..<n {
          if text[i] == "(" {
            CountOpen += 1
            CheckStack.append(text[i])
          }
          if text[i] == ")" {
            CountClose += 1
            CheckStack.append(text[i])
          }
          if C_in_S(c: text[i], text: operations) && C_in_S(c: text[i + 1], text: operations) {
            return false
          }
          if (text[i] == "(") && (C_in_S(c: text[i + 1], text: AfterOpen) || (text[i + 1] == ")")) {
            return false
          }
        }

        var pos: Int = 0
        pos = Find_Char_In_Vec(c: ")", vec: CheckStack)

        if CountClose == CountOpen {
          while pos != -1 {
            CheckStack[pos] = "0"
            CountClose -= 1
            for i in stride(from: pos - 1, to: -1, by: -1) {
              if CheckStack[i] == "(" {
                CheckStack[i] = "0"
                CountOpen -= 1
                break
              }
            }
            pos = Find_Char_In_Vec(c: ")", vec: CheckStack)
          }
        }

        if (CountClose == 0) && (CountOpen == 0) {
          return true
        }
        return false

      } else {
        return false
      }
    }

    func Element_From_String(text: inout [Character]) -> [Character] {
      let service: [Character] = ["+", "-", "*", "/", "(", ")"]
      var element: [Character] = []
      let n: Int = text.count
      var i: Int = 0
      var flag_1: Int = 1

      if (text[i] == "-") && (flag == -1) {
        element.append(text[i])
        i += 1
        flag = 0
      } else {
        flag = -2
      }

      if (text[0] == "(") && (text[1] == "-") {
        flag = -1
        i = 0
      }

      if (text[0] == "(") && (text[1] == "-") && (text[2] >= "0") && (text[2] <= "9") {
        for j in 2..<n {
          if text[j] == ")" {
            break
          }
          if C_in_S(c: text[j], text: service) {
            flag_1 = 1
            break
          } else {
            flag_1 = 0
          }
        }
      }

      if flag_1 == 0 {
        for j in 1..<n {
          if text[j] == ")" {
            break
          }
          element.append(text[j])
        }
        for _ in 0..<(element.count + 2)  //text.erase
        {
          text.removeFirst()
        }
        flag = 0
        return element
      }

      if !C_in_S(c: text[i], text: service) {
        for j in i..<n {
          if C_in_S(c: text[j], text: service) {
            break
          }
          element.append(text[j])
        }
      } else {
        element = []
        element.append(text[0])
      }

      for _ in 0..<element.count  //text.erase
      {
        text.removeFirst()
      }
      return element
    }

    func Calc(a: Double, c: Character, b: Double) -> Double {
      if c == "*" {
        return a * b
      }
        
      if c == "/" && b != 0 {
          return a / b
      } else if c == "/" && b == 0{
        divisionErrorFlag = true
      }
        
      if c == "+" {
        return a + b
      }
        
      if c == "-" {
        return a - b
      }
        
      return 0
    }

    func Calculate(text: [Character]) -> String {
        if !check_text(text: text) {
            return "Invalid data"
        }
        
      var Numbers: [Double] = []
      var Service: [Character] = []
      var text_copy: [Character] = text

      var Num: Double = 0
      var A: Double = 0
      var B: Double = 0
      var C: Character = "0"

      let CalcOp: [Character] = ["+", "-", "*", "/"]
      var element: [Character] = []

      let prior: [Character: Int] = ["*": 2, "/": 2, "+": 1, "-": 1]
      while text_copy.count != 0 {
        element = Element_From_String(text: &text_copy)

        if (element[0] >= "0" && element[0] <= "9") || (element[0] == "-" && flag == 0) {
          Num = Double(String(element)) ?? 0
          Numbers.append(Num)
        } else {
          if C_in_S(c: element[0], text: CalcOp) {
            if Service.count == 0 {
              Service.append(element[0])
            } else {
              if (prior[Service[Service.count - 1]] ?? 0) < (prior[element[0]] ?? 0) {
                Service.append(element[0])
              } else {
                C = Service.removeLast()
                B = Numbers.removeLast()
                A = Numbers.removeLast()
                Numbers.append(Calc(a: A, c: C, b: B))
                text_copy.insert(element[0], at: 0)
              }
            }
          } else {
            if element[0] == "(" {
              Service.append(element[0])
            } else {
              if element[0] == ")" {
                for i in stride(from: Service.count - 1, to: -1, by: -1) {
                  if Service[i] == "(" {
                    break
                  }
                  C = Service.removeLast()
                  B = Numbers.removeLast()
                  A = Numbers.removeLast()
                  Numbers.append(Calc(a: A, c: C, b: B))
                }
                Service.removeLast()
              }
            }
          }
        }
      }
        for _ in stride(from: Service.count - 1, to: -1, by: -1) {
            C = Service.removeLast()
            B = Numbers.removeLast()
            A = Numbers.removeLast()
            Numbers.append(Calc(a: A, c: C, b: B))
          }

    var ans: String = ""
      if (Numbers.count == 1) && (Service.count == 0) {
        let x = Numbers[0]
        let roundedValue1 = round(x * 1_000_000) / 1_000_000
        ans = String(roundedValue1)
      }
    if divisionErrorFlag {
        divisionErrorFlag = false
        return "Division by zero!"
    }
    return ans.isEmpty ? "Invalid data" : ans
    }
}
