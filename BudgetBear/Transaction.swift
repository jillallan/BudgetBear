//
//  Item.swift
//  BudgetBear
//
//  Created by Jill Allan on 12/02/2025.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var timestamp: Date
    var amount: Double
    var title: String
    var category: TransactionCategory

    init(timestamp: Date, amount: Double, title: String, category: TransactionCategory) {
        self.timestamp = timestamp
        self.amount = amount
        self.title = title
        self.category = category
    }
}
