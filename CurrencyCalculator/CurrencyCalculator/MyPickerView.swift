//
//  MyPickerView.swift
//  CurrencyCalculator
//
//  Created by Decagon on 27/01/2022.
//

import Foundation
import UIKit
 
class MyPickerView : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
  
 // var data = DataLoader()
 
    var currencies : [String]!
    var pickerTextField : UITextField!
    var pickerTextField2 : UITextField!
 
  init(currencies: [String], dropdownField: UITextField) {
      super.init(frame: CGRect.zero)
 
        self.currencies = currencies
        self.pickerTextField = dropdownField
        self.pickerTextField2 = dropdownField
 
        self.delegate = self
        self.dataSource = self
 
      DispatchQueue.main.async { [self] in
        //let currencies = self.data.currencyCode
            if currencies.count > 0 {
                self.pickerTextField.text = self.currencies[0]
                //self.values = self.values[0]
                self.pickerTextField.isEnabled = true
                self.pickerTextField2.isEnabled = true
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
                self.pickerTextField2.isEnabled = false
            }
        }
      
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // Sets number of columns in picker view
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
    // Sets the number of rows in the picker view
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return currencies.count
  }
 
    // This function sets the text of the picker view to the content of the "currencies" array
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return currencies[row]
      }
 
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
          pickerTextField.text = currencies[row]
          pickerTextField2.text = currencies[row]
          
      }
 
}
