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
    @State private var measureType = 0
    
    let units = [UnitsLen.metres, UnitsLen.kilometres, UnitsLen.feet, UnitsLen.yards, UnitsLen.miles]
    
    //TODO: - switch modes
    let settings = ["Length", "Temperature"]
    
    var finalResult: Double {
        
        let amount = Double(unitInput) ?? 0
        
        let measurement = Measurement(value: amount, unit: units[selectedUnitFrom].getUnit())
        
        let converted = measurement.converted(to: units[selectedUnitTo].getUnit())
        
        return converted.value
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section(header: Text("Measurement")) {
                    Picker("sett", selection: $measureType) {
                        ForEach(0..<settings.count) {
                            Text("\(self.settings[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
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
                
                Section(header: Text("Equals to")) {
                    Text("\(finalResult, specifier: "%.5g") \(units[selectedUnitTo].rawValue)")
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
