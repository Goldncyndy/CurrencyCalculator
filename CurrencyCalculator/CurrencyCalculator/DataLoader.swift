//
//  DataLoader.swift
//  CurrencyCalculator
//
//  Created by Decagon on 27/01/2022.
//

import Foundation

class DataLoader {
  
  var currencyCode: [String] = []
  var values: [Double] = []
  
  public func getCurrencies(){
    
    
    let url = "https://open.exchangerate-api.com/v6/latest"
    
    if let url = URL(string: url){
      URLSession.shared.dataTask(with: url){ data, response, error in
        if let data = data {
          do {
            let json = try JSONDecoder().decode(ExchangeRate.self, from: data)
            self.currencyCode.append(contentsOf: json.rates.keys)
            self.values.append(contentsOf: json.rates.values)
            print(json)
            print(self.currencyCode)
            print(self.values)
            //completionHandler(json)
          } catch {
            print("\(error.localizedDescription)")
          }
        }
      }.resume()
    }
  }
  
  public func pullCurrencyData(completionHandler: @escaping (ExchangeRate) -> ()) {
        let url = "https://open.exchangerate-api.com/v6/latest"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(ExchangeRate.self, from: data)
                      print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}
