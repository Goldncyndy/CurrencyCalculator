//
//  ExchangeRates.swift
//  CurrencyCalculator
//
//  Created by Decagon on 27/01/2022.
//

import Foundation

struct ExchangeRate: Codable {
  let rates: [String: Double]
}
