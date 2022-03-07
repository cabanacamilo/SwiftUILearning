//
//  CreditCard+CoreDataProperties.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/07.
//
//

import Foundation
import CoreData


extension CreditCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreditCard> {
        return NSFetchRequest<CreditCard>(entityName: "CreditCard")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var number: String?
    @NSManaged public var type: String?
    @NSManaged public var expenses: NSSet?
    
    
    public var strongId: UUID {
        id ?? UUID()
    }
    
    public var strongNumber: String {
        number ?? "0000-0000-0000"
    }
    
    public var strongType: String {
        type ?? "Visa"
    }
    
    public var strongExpenses: [CreditCardExpenses] {
        let set = expenses as? Set <CreditCardExpenses> ?? []
        
        return set.sorted { $0.strongDate < $1.strongDate}
    }

}

// MARK: Generated accessors for expenses
extension CreditCard {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: CreditCardExpenses)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: CreditCardExpenses)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}

extension CreditCard : Identifiable {

}
