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
    
    let conversionUnits = ["m", "km", "ft", "yd", "mi"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $unitAmount, format: .number)
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
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
