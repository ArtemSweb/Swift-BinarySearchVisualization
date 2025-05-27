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

    let numbers = Array(1...100)
    // Количество колонок в сетке
    let columns = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        VStack(spacing: 20) {
            controlPanel
            gridView
        }
    }
    
    private var controlPanel: some View {
        HStack {
            TextField("Что ищем?", text: $number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 200)
            
            Button("Искать") {
                
            }
        }
    }
    
    private var gridView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(numbers, id: \.self) { number in
                    NumberBlock(number: number)
                }
            }
        }
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
            .font(.system(size: 18, weight: .bold))
            .frame(width: 40, height: 40)
            .background(color.value)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    BinarySearchView()
}
