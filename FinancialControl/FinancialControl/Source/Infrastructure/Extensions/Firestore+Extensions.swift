//
//  Firestore+Extensions.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import FirebaseFirestore

extension Firestore {
    
    // MARK: Access collection
    
    func collection(_ collectionType: CollectionType) -> CollectionReference {
        collection(collectionType.rawValue)
    }
}
