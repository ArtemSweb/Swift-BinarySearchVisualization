//
//  ContentView.swift
//  BinarySearchVisualization
//
//  Created by Артем Солодовников on 27.05.2025.
//
import SwiftUI

struct BinarySearchView: View {
    @StateObject private var model = BinarySearchModel()
    @State private var number = ""
    @State private var currentStep = 0
    let numbers = Array(1...100)
    // Количество колонок в сетке
    let columns = [GridItem(.adaptive(minimum: 40), spacing: 5)]
    
    var body: some View {
        VStack(spacing: 20) {
            controlPanel
            gridView
            navigationButtons
        }
    }
    
    private var controlPanel: some View {
        HStack {
            TextField("Что ищем? (1-100)", text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 300)
        }
    }
    
    private var gridView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 13) {
                ForEach(numbers, id: \.self) { number in
                    NumberBlock(number: number)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var navigationButtons: some View {
        HStack(spacing: 20) {
            Button(action: { currentStep = max(0, currentStep - 1) }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Назад")
                }
            }
            .buttonStyle(MaterialButtonStyle(
                backgroundColor: currentStep == 0 ? Color(hex: "#78909C") : Color(hex: "#5C6BC0"),
                foregroundColor: Color.white
            ))
            .disabled(currentStep == 0)
            
            Button(action: { currentStep = min(20, currentStep + 1) }) {
                HStack {
                    Text("Вперед")
                    Image(systemName: "chevron.right")
                }
            }
            .buttonStyle(MaterialButtonStyle(
                backgroundColor: currentStep == 20 ? Color(hex: "#78909C") : Color(hex: "#5C6BC0"),
                foregroundColor: Color.white
            ))
            .disabled(currentStep == 20)
        }
        .padding()
    }
}

struct NumberBlock: View {
    let number: Int
    
    private var color: NumberColor {
        let colors = NumberColor.allCases
        return colors[number % colors.count]
    }
    
    var body: some View {
        Text("\(number)")
            .font(.system(size: 16, weight: .bold))
            .frame(width: 30, height: 30)
            .background(color.value)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}

struct MaterialButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .medium, design: .default))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .shadow(color: Color.black.opacity(0.2), radius: 4, y: 2)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    BinarySearchView()
}
