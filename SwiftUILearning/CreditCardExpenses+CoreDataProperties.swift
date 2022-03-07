//
//  CreditCardExpenses+CoreDataProperties.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/07.
//
//

import Foundation
import CoreData


extension CreditCardExpenses {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreditCardExpenses> {
        return NSFetchRequest<CreditCardExpenses>(entityName: "CreditCardExpenses")
    }

    @NSManaged public var date: String?
    @NSManaged public var id: UUID?
    @NSManaged public var value: String?
    @NSManaged public var card: CreditCard?

    
    public var strongDate: String {
        date ?? "00/00/0000"
    }
    
    public var strongId: UUID {
        id ?? UUID()
    }
    
    public var strongValue: String {
        value ?? "¥0"
    }
}

extension CreditCardExpenses : Identifiable {

}
