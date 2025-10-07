//
//  TermsResponseModel.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 04/10/25.
//

struct TermsResponseModel: Codable {
    let termsPT: String
    let termsEN: String
    
    nonisolated enum CodingKeys: String, CodingKey {
        case termsPT = "terms_pt"
        case termsEN = "terms_en"
    }
}
