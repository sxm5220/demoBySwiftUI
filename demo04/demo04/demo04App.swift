//
//  demo04App.swift
//  demo04
//
//  Created by 宋晓明 on 2025/9/18.
//

import SwiftUI

@main
struct demo04App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainTabView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
