//
//  twoDoApp.swift
//  2Do
//
//  Created by Turan, Kaan on 14.02.2023.
//

import SwiftUI

@main
struct twoDoApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
