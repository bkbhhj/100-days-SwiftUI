//
//  ContentView.swift
//  challengeday
//
//  Created by Павел Тимофеев on 20.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkValue = 0.0
    @State private var tipConvert = 0
    
let tipConverts = ["км", "фут","ярд","миля"]
    
    var result: Double {
        var count = 0.0
        switch tipConvert {
        case 0: count = 1000
        case 1: count = 0.3048
        case 2: count = 0.9148
        case 3: count = 1609.34
        default:
            return count
        }
        return  checkValue / count
    }
 
    var body: some View {

        NavigationView {
            Form {
                Section {
                    TextField("Please add value", value: $checkValue, format: .number)
                } header: {
                    
                Text("Initial value per metr")
                }
              
                Section {
                    
                    Picker(selection: $tipConvert, label: Text("Choose a setting")) {
                        
                        ForEach(0..<tipConverts.count) {
                            
                            index in Text(self.tipConverts[index])
                        }
                        
                    }.pickerStyle(.segmented)
                } header: {
                    
                    Text("Initial value per metr")
                    
                }
                Section {
                    
                    Text(result,  format: .number)
                    
                } header: {
                    
                    Text ("Total value")
                }

        }.navigationTitle("Convert value")

        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

