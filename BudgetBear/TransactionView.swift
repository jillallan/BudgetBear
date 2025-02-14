//
//  ContentView.swift
//  BudgetBear
//
//  Created by Jill Allan on 12/02/2025.
//

import SwiftUI
import SwiftData

struct TransactionView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Transaction]

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        VStack {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                            HStack {
                                Text(item.title)
                                Spacer()
                                Text(item.amount, format: .currency(code: "GBP"))
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Transaction(
                timestamp: Date(),
                amount: 0.0,
                title: "New purchase",
                category: .balanceAdjustment
            )
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    TransactionView()
        .modelContainer(for: Transaction.self, inMemory: true)
}
