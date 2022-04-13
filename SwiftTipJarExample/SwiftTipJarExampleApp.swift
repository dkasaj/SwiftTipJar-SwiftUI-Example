//
//  SwiftTipJarExampleApp.swift
//  SwiftTipJarExample
//
//  Created by Daniel Kasaj on 13.04.2022..
//

import SwiftUI
import SwiftTipJar

@main
struct SwiftTipJarExampleApp: App {
    let tipsIdentifiers = ["com.test.smallTip", "com.test.mediumTip", "com.test.largeTip", "com.test.hugeTip"]
    let tipJar: SwiftTipJar
    init() {
        tipJar = SwiftTipJar(tipsIdentifiers: Set(tipsIdentifiers))
        tipJar.productsRequest?.start()
        tipJar.startObservingPaymentQueue()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(tipsIdentifiers: tipsIdentifiers)
                .environmentObject(tipJar)
        }
    }
}

extension SwiftTipJar: ObservableObject { }
