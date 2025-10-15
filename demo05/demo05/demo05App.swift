//
//  demo05App.swift
//  demo05
//
//  Created by 宋晓明 on 2025/9/22.
//

import SwiftUI
import SwiftData

@main
struct demo05App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
