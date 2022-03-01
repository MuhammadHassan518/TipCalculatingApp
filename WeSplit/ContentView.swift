//
//  ContentView.swift
//  WeSplit
//
//  Created by muhammad hassan on 03/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = 0.0
    @State var numberOfPeople = 1
    @State var tipPercentage = 10
    @State var grandTotal = 0.0
    
    let tipPercentages =  0.0 //[10, 15, 20, 25]
    // calculate tip persentage
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentage + 0)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal: Double = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
   
    
    var total: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal: Double = checkAmount + tipValue
        return grandTotal
    }
    

    var body: some View{
        NavigationView{
        Form {
        Section
        {
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            .keyboardType(.decimalPad)
            .padding()
            .background(.red)

        Picker("Number of people", selection: $numberOfPeople)
            {
            ForEach(1 ..< 100)
                {   Text("\($0) people")
                    .padding()
                    .background(.red)
                }
            }
            .padding(.horizontal)
            .background(.green)
        }
        Section
            {
                Picker(" Tips in Percentage ", selection: $tipPercentage)
                    {
                    ForEach(0 ..< 100)
                        { number in  Text("\(number)")
                                .padding()
                                .background(.red)
                        }
                    }
                    .padding(.horizontal)
                    .background(.blue)
            }
            
        header: {
            Text("How much tip do you want to leave?")
                .padding()
                .background(.secondary)
        }            
        Section {
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .padding()
                .padding(.horizontal)
                .background(.green)
                }
        header:
            {  Text("Amount Per Person                                   ")
                    .padding()
                    .background(.secondary)
            }

            Section
            {  Text(total, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .padding()
                    .background(.blue)
            }
            
        header:
            {   Text("Tips with toatal")
                    .padding()
                    .background(.secondary)
            }
           }.navigationTitle(" Payment with tips")
        }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
