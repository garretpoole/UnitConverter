//
//  ContentView.swift
//  UnitConverter
//
//  Created by Garret Poole on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var unitAmount = 0.0
    @State private var convertingUnit = "m"
    @State private var convertToUnit = "km"
    @FocusState private var amountFocused: Bool
    let conversionUnits = ["m", "km", "ft", "yd", "mi"]
    
    var convertedAmount: Double{
        if convertingUnit == convertToUnit{
            return unitAmount
        }
        //convert initial amount to feet
        var tempFeetAmount = 0.0
        switch convertingUnit{
        case "m":
            tempFeetAmount = unitAmount*3.28084
        case "km":
            tempFeetAmount = unitAmount*3280.84
        case "ft":
            tempFeetAmount = unitAmount
        case "yd":
            tempFeetAmount = unitAmount*3
        case "mi":
            tempFeetAmount = unitAmount*5280
        default:
            return -1.0
        }
        //convert inital foot amount to necessary unit
        var finalAmountConverted = 0.0
        switch convertToUnit{
        case "m":
            finalAmountConverted = tempFeetAmount/3.28084
        case "km":
            finalAmountConverted = tempFeetAmount/3280.84
        case "ft":
            finalAmountConverted = tempFeetAmount
        case "yd":
            finalAmountConverted = tempFeetAmount/3
        case "mi":
            finalAmountConverted = tempFeetAmount/5280
        default:
            return -1.0
        }
        return finalAmountConverted
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $unitAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                    Picker("Starting Unit", selection: $convertingUnit){
                        ForEach(conversionUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Initial Amount")
                }
                
                Section{
                    Picker("Convert To", selection: $convertToUnit){
                        ForEach(conversionUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert To")
                }
                
                Section{
                    Text(convertedAmount.formatted())
                } header: {
                    Text("Converted to \(convertToUnit)")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
