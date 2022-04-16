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
    let tipJar: SwiftTipJar

    init() {
        tipJar = SwiftTipJar(tipsIdentifiers: Set([
            "com.test.smallTip",
            "com.test.mediumTip",
            "com.test.largeTip",
            "com.test.hugeTip"
        ]))
        tipJar.startObservingPaymentQueue()
        tipJar.productsRequest?.start()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tipJar)
        }
    }
}
