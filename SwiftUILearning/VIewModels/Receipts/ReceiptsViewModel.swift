//
//  ReceiptsViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/22.
//

import Foundation

@MainActor

class ReceiptsViewModel: ObservableObject {
    
    @Published var receipts = [Receipt]()
    
    func fecthReceipts() async {
        let result = await APIService.shared.fecthReceipts()
        guard let receipts = result?.receipts else {
            return
        }
        self.receipts = receipts
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
