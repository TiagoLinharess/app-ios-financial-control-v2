//
//  CollectionReference+Extensions.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 14/07/25.
//

import FirebaseFirestore

extension CollectionReference {
    
    // MARK: Add document
    
    @discardableResult
    func addDocument<T: Encodable>(_ data: T) async throws -> DocumentReference {
        try await withCheckedThrowingContinuation { continuation in
            do {
                var document: DocumentReference?
                document = try self.addDocument(from: data) { error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(returning: document!)
                    }
                }
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
    
    // MARK: Update document
    
    nonisolated
    func updateData<T: Encodable>(_ model: T, reference: String) async throws {
        do {
            let data = try Firestore.Encoder().encode(model)
            try await self.document(reference).updateData(data)
        } catch {
            throw error
        }
    }
}
