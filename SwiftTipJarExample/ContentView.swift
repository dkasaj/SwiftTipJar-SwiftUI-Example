//
//  ContentView.swift
//  SwiftTipJarExample
//
//  Created by Daniel Kasaj on 13.04.2022..
//

import SwiftUI
import SwiftTipJar

struct ContentView: View {
    @EnvironmentObject var tipJar: SwiftTipJar
    var tipsIdentifiers: [String] // Will get this populated by the @main App

    @State private var showingThankYou = false

    var body: some View {
        VStack(spacing: 24) {
            ForEach(tipsIdentifiers, id:\.self) { identifier in
                Button {
                    tipJar.initiatePurchase(productIdentifier: identifier)
                } label: {
                    Text("\(tipJar.localizedTitleFor(identifier: identifier)!) \(tipJar.localizedPriceFor(identifier: identifier)!)")
                    // Will crash if you forgot to set up identifiers in StoreKit configuration file or ASC
                }
            }
        }
        .sheet(isPresented: $showingThankYou) {
            ThankYou()
        }
        .onAppear {
            tipJar.transactionSuccessfulBlock = {
                showingThankYou = true
            }
            tipJar.transactionFailedBlock = {
                // best if nothing on iOS - user did tap cancel
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tipsIdentifiers: [])
    }
}
