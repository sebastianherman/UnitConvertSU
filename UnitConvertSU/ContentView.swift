//
//  ContentView.swift
//  UnitConvertSU
//
//  Created by Sebastian Herman on 5/18/20.
//  Copyright © 2020 Sebastian Herman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitInput = ""
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 0
    
    let units = [Units.metres, Units.kilometres, Units.feet, Units.yards, Units.miles]
    
    var finalResult: Double {
        
        let amount = Double(unitInput) ?? 0
        
        let measurement = Measurement(value: amount, unit: units[selectedUnitFrom].getUnit())
        
        let converted = measurement.converted(to: units[selectedUnitTo].getUnit())
        
        return converted.value
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section(header: Text("Convert from")) {
                    TextField("start typing...", text: $unitInput).keyboardType(.decimalPad)
                    Picker("units", selection: $selectedUnitFrom) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0].rawValue)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert To")) {
                    Picker("units", selection: $selectedUnitTo) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0].rawValue)")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(finalResult, specifier: "%.5g")")
                }
            }
            
            .navigationBarTitle("Convert SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
