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
    @State private var showingThankYou = false

    var body: some View {
        VStack(spacing: 24) {

            ForEach(tipJar.tips, id:\.identifier) { tip in
                Button {
                    tipJar.initiatePurchase(productIdentifier: tip.identifier)
                } label: {
                    Text("\(tip.displayName) \(tip.displayPrice)")
                }
            }

            Text("Thank you!")
                .bold()
                .padding(.top, 24)
                .opacity(showingThankYou ? 1 : 0)

        }
        .onAppear {
            tipJar.transactionSuccessfulBlock = {
                showingThankYou = true
            }
            tipJar.transactionFailedBlock = {
                // No need to do anything, user did tap cancel
            }
        }
        .padding(24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
