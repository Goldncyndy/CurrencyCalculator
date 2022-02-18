//
//  Extension+DashboardViewController.swift
//  CurrencyCalculator
//
//  Created by Decagon on 27/01/2022.
//

import Foundation
import UIKit

extension DashboardViewController {
  
  func setupDefaultView() {
    // laying out views on the screen
    view.addSubview(signUpLabel)
    view.addSubview(hamburgerIcon)
    contentView.addSubview(currencyCalc)
    contentView.addSubview(firstCurrencyTextField)
    contentView.addSubview(secondCurrencyTextField)
    contentView.addSubview(convertButton)
    contentView.addSubview(linkLabel)
    contentView.addSubview(dotLabel)
    contentView.addSubview(graphView)
    graphView.addSubview(lineChartView)
    contentView.addSubview(stackViews)
//    contentView.addSubview(newView)
    contentView.addSubview(pickerTextField)
    contentView.addSubview(pickerTextField2)
    contentView.addSubview(conversionArrow)
    contentView.addSubview(firstCurrencyLabel)
    contentView.addSubview(secondCurrencyLabel)
    contentView.addSubview(dropdownIcon)
    contentView.addSubview(dropdownIcon2)
  }
  
  func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 30).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    contentView.heightAnchor.constraint(equalToConstant: 1150).isActive = true
  }

  func setupConstraints() {
    
    setupDefaultView()
    setupScrollView()
    
    NSLayoutConstraint.activate([
      // constraints declarations of views on the screen
      
      // signup constraint
      signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      // hamburgerIcon constraint
      hamburgerIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      hamburgerIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      hamburgerIcon.heightAnchor.constraint(equalToConstant: 20),
      hamburgerIcon.widthAnchor.constraint(equalToConstant: 20),
      // stackview constraint
      stackViews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
      stackViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      stackViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      // firstcurrency textfield constraint
      firstCurrencyTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 230),
      firstCurrencyTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  30),
      firstCurrencyTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      firstCurrencyTextField.heightAnchor.constraint(equalToConstant: 50),
      // // firstcurrency label constraint
      firstCurrencyLabel.topAnchor.constraint(equalTo: firstCurrencyTextField.topAnchor, constant: 20),
      firstCurrencyLabel.trailingAnchor.constraint(equalTo: firstCurrencyTextField.trailingAnchor, constant: -20),
      // secondcurrency textfield constraint
      secondCurrencyTextField.topAnchor.constraint(equalTo: firstCurrencyTextField.bottomAnchor, constant: 30),
      secondCurrencyTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      secondCurrencyTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      secondCurrencyTextField.heightAnchor.constraint(equalToConstant: 50),
      // seconfcurrency label constraint
      secondCurrencyLabel.topAnchor.constraint(equalTo: secondCurrencyTextField.topAnchor, constant: 16),
      secondCurrencyLabel.trailingAnchor.constraint(equalTo: secondCurrencyTextField.trailingAnchor, constant: -20),
      // picker textfield constraint
      pickerTextField.topAnchor.constraint(equalTo: secondCurrencyTextField.bottomAnchor, constant: 30),
      pickerTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      pickerTextField.heightAnchor.constraint(equalToConstant: 50),
      pickerTextField.widthAnchor.constraint(equalToConstant: 140),
      // dropdown Icon constraint
      dropdownIcon.topAnchor.constraint(equalTo: pickerTextField.topAnchor, constant: 17),
      dropdownIcon.trailingAnchor.constraint(equalTo: pickerTextField.trailingAnchor, constant: -15),
      dropdownIcon.heightAnchor.constraint(equalToConstant: 20),
      dropdownIcon.widthAnchor.constraint(equalToConstant: 20),
      // conversion arrow constraint
      conversionArrow.topAnchor.constraint(equalTo: secondCurrencyTextField.bottomAnchor, constant: 45),
      conversionArrow.leadingAnchor.constraint(equalTo: pickerTextField.trailingAnchor, constant: 10),
      conversionArrow.trailingAnchor.constraint(equalTo: pickerTextField2.leadingAnchor, constant: -10),
      conversionArrow.heightAnchor.constraint(equalToConstant: 20),
      conversionArrow.widthAnchor.constraint(equalToConstant: 40),
      // picker textfield2 constraint
      pickerTextField2.topAnchor.constraint(equalTo: secondCurrencyTextField.bottomAnchor, constant: 30),
      pickerTextField2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      pickerTextField2.leadingAnchor.constraint(equalTo: conversionArrow.trailingAnchor, constant: 20),
      pickerTextField2.heightAnchor.constraint(equalToConstant: 50),
      pickerTextField2.widthAnchor.constraint(equalToConstant: 140),
      // dropdown Icon constraint
      dropdownIcon2.topAnchor.constraint(equalTo: pickerTextField2.topAnchor, constant: 17),
      dropdownIcon2.trailingAnchor.constraint(equalTo: pickerTextField2.trailingAnchor, constant: -15),
      dropdownIcon2.heightAnchor.constraint(equalToConstant: 20),
      dropdownIcon2.widthAnchor.constraint(equalToConstant: 20),
      // convert button constraint
      convertButton.topAnchor.constraint(equalTo: pickerTextField.bottomAnchor, constant: 50),
      convertButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      convertButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      convertButton.heightAnchor.constraint(equalToConstant: 50),
      //link label constraint
      linkLabel.topAnchor.constraint(equalTo: convertButton.bottomAnchor, constant: 20),
      linkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      linkLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      // graph view constraint
      graphView.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 15),
      graphView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
      graphView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
      graphView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      graphView.heightAnchor.constraint(equalToConstant: 500),
      // linechart constraint
      lineChartView.topAnchor.constraint(equalTo: graphView.topAnchor, constant: 70),
      lineChartView.leadingAnchor.constraint(equalTo: graphView.leadingAnchor, constant: 20),
      lineChartView.trailingAnchor.constraint(equalTo: graphView.trailingAnchor, constant: -20),
      //lineChartView.bottomAnchor.constraint(equalTo: graphView.bottomAnchor, constant: -100),
      lineChartView.heightAnchor.constraint(equalToConstant: 250)
      
    ])
  }
  
}
