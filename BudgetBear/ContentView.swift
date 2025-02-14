//
//  ContentView.swift
//  BudgetBear
//
//  Created by Jill Allan on 13/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Overview", systemImage: "wallet.bifold") {
                DashboardView()
            }
            Tab("Account", systemImage: "wallet.bifold") {
                AccountView()
            }
            Tab("Spending", systemImage: "creditcard") {
                TransactionView()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
