//
//  DashboardViewController.swift
//  CurrencyCalculator
//
//  Created by Decagon on 26/01/2022.
//

import UIKit
import Charts

class DashboardViewController: UIViewController {
  // property declaration
  let data = DataLoader()
  var current: ExchangeRate?
  
  var currencyCode: [String: Double] = [:]
  var currencyString: [String] = []
  var values: [Double] = []
  var activeCurrency = 0.0
  
  lazy var pickerView: UIPickerView = {
    let picker = UIPickerView()
    return picker
  }()
  // MARK: - picker textfield declaration
  let pickerTextField: LeftPaddedTextField = {
    let picker = LeftPaddedTextField()
    picker.backgroundColor = .systemGray6
    picker.layer.cornerRadius = 8
    picker.isEnabled = false
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
  // MARK: - picker textfield2 declaration
  let pickerTextField2: LeftPaddedTextField = {
    let picker = LeftPaddedTextField()
    picker.backgroundColor = .systemGray6
    picker.layer.cornerRadius = 8
    picker.isEnabled = false
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()
  
  // MARK: - SCROLL VIEW AND CONTENT VIEW SETUP
  let contentView: UIView = {
  let content = UIView()
      //content.backgroundColor = .cyan
      content.translatesAutoresizingMaskIntoConstraints = false
    return content
  }()
  
  let scrollView: UIScrollView = {
  let scroll = UIScrollView()
    //scroll.backgroundColor = .black
    scroll.showsHorizontalScrollIndicator = false
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }()
  // MARK: - SignUp Label declaration
  lazy var signUpLabel: UILabel = {
    let name = UILabel()
    name.textColor = .systemGreen
    name.text = "Sign up"
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  // MARK: - hamburger icon declaration
  let hamburgerIcon: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(menubarButtonItemTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(named: "hamburger"), for: .normal)
    return button
  }()
  // MARK: - dropdown icons declaration
  let dropdownIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(dropdownIconItemTapped), for: .touchUpInside)
    button.setBackgroundImage(UIImage(named: "down-arrow"), for: .normal)
    return button
  }()
  
  let dropdownIcon2: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(dropdownIcon2ItemTapped), for: .touchUpInside)
    button.setBackgroundImage(UIImage(named: "down-arrow"), for: .normal)
    return button
  }()
  
//  lazy var hamburgerIcon = UIBarButtonItem(image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menubarButtonItemTapped))
  // MARK: - currencycalculator Label declaration
  lazy var currencyCalc: UILabel = {
    let name = UILabel()
    name.textColor = .systemBlue
    name.text = "Currency \nCalculator"
    name.numberOfLines = 0
    name.font = UIFont(name: "Helvetica", size: 45)
    name.font = UIFont.boldSystemFont(ofSize: 45)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  
  lazy var dotLabel: UILabel = {
    let name = UILabel()
    name.textColor = .systemGreen
    name.text = "."
    name.font = UIFont(name: "Helvetica", size: 55)
    name.font = UIFont.boldSystemFont(ofSize: 55)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  // MARK: - firstCurrency textfield declaration
  let firstCurrencyTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.tintColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    textField.placeholder = "Enter amount to convert"
    textField.keyboardType = .numberPad
    textField.backgroundColor = .systemGray6
    textField.isUserInteractionEnabled = true
    textField.layer.cornerRadius = 8
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged )
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont(name: "Helvetica", size: 16)
    return textField
  }()
  
  let conversionArrow: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "arrow")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - secondCurrency textfield declaration
  let secondCurrencyTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.tintColor = UIColor(red: 0.29, green: 0.05, blue: 0.76, alpha: 1.00)
    textField.placeholder = "Converted"
    textField.isEnabled = false
    textField.backgroundColor = .systemGray6
    textField.isUserInteractionEnabled = true
    textField.layer.cornerRadius = 8
    //textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged )
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont(name: "Helvetica", size: 16)
    return textField
  }()
  // MARK: - firstCurrency label declaration
  lazy var firstCurrencyLabel: UILabel = {
    let name = UILabel()
    name.textColor = .systemGray2
    name.text = "EUR"
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  // MARK: - secondCurrency label declaration
  lazy var secondCurrencyLabel: UILabel = {
    let name = UILabel()
    name.textColor = .systemGray2
    name.text = "USD"
    name.font = UIFont(name: "Helvetica", size: 16)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  // MARK: - convert button declaration
  lazy var convertButton: UIButton = {
    let button = UIButton()
    button.setTitle("Convert", for: .normal)
    button.addTarget(self, action: #selector(convertCurrencyButton), for: .touchUpInside)
    button.backgroundColor = UIColor(red: 0.361, green: 0.722, blue: 0.361, alpha: 1)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 8
    return button
  }()

  lazy var linkLabel: UILabel = {
    let name = UILabel()
    name.textColor = .blue
    name.text = "Mid-market exchange rate at 13:38 UTC"
    name.font = UIFont(name: "Helvetica", size: 12)
    name.translatesAutoresizingMaskIntoConstraints = false
    return name
  }()
  // MARK: - graphview declaration
  lazy var graphView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    view.layer.cornerRadius = 20
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - linechartView declaration
  lazy var lineChartView: LineChartView = {
    let view = LineChartView()
    view.backgroundColor = .systemBlue
    //view.layer.cornerRadius = 20
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - stackview declaration
  lazy var stackViews: UIStackView = {
  let stackView   = UIStackView()
    stackView.axis  = NSLayoutConstraint.Axis.horizontal
    stackView.distribution  = UIStackView.Distribution.fill
    stackView.alignment = UIStackView.Alignment.lastBaseline
    stackView.spacing   = 1.0
    stackView.addArrangedSubview(currencyCalc)
    stackView.addArrangedSubview(dotLabel)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  public var currencies = [
                    "-Select-",
                    ]
  
  var selectedCurrency = AvailableCurrency.EUR
  
  var currency = [ExchangeRate]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupConstraints()
    randomize()
    setChartValues()
    convertCurrencyButton()
    loadData()
    dropdownIconItemTapped()
    dropdownIcon2ItemTapped()
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  // MARK: - loadData function declaration
  func loadData(){
    data.pullCurrencyData { [weak self] currentCurrency in
      self?.current = currentCurrency
      self?.currencyCode = currentCurrency.rates
      guard let code = self?.currencyCode else { return }
      //print("the current is \(code)")
      for (key, value) in code {
        self?.currencies.append(key)
        //print(self?.currencies as Any)
        DispatchQueue.main.async {
        if self?.pickerTextField.text == key {
          self?.activeCurrency = value
          print("This is the active currncy \(self?.activeCurrency)")
        }
        }
        guard let curret = self?.currencies else { return }
        self?.pickerTextField.loadDropdownData(data: curret)
        self?.pickerTextField2.loadDropdownData(data: curret)
        
//       UserDefaults.standard.set(self?.currencyString.append(key), forKey: "test")
        self?.values.append(value)
        guard (self?.values) != nil else { return }
      }
      self?.values.append(contentsOf: currentCurrency.rates.values)
    }
  }
  
  override func viewDidLayoutSubviews() {
    scrollView.isScrollEnabled = true
    scrollView.showsVerticalScrollIndicator = false
    scrollView.contentSize = CGSize(width: 400, height: 1000)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)
      view.endEditing(true)
  }
  // MARK: - currency conversion function declaration
  func currencyConversion(_ input: Double) {
    let text = firstCurrencyTextField.text
    let firstCurrencyRegEx  = "[0-9]{2,64}"
    let textTest = NSPredicate(format: "SELF MATCHES %@", firstCurrencyRegEx)
    let firstCurResult = textTest.evaluate(with: text)
    if firstCurResult {
      guard let amountText = Double(text!) else { return }
      let total = amountText * input
      secondCurrencyTextField.text = String(format: "%.2f", total)

    }
  }
  // MARK: - dismiss keyboard function declaration
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    firstCurrencyLabel.text = pickerTextField.text
    secondCurrencyLabel.text = pickerTextField2.text
  }
  
  @objc func convertCurrencyButton() {
    currencyConversion(activeCurrency)

  }
  
  @objc func menubarButtonItemTapped() {
  
  }
  
  @objc func dropdownIconItemTapped() {
    //self?.pickerTextField.loadDropdownData(data: curret)
  }
  
  @objc func dropdownIcon2ItemTapped() {
    //self?.pickerTextField2.loadDropdownData(data: curret)
  }
  
  func randomize() {
    let count = Int(arc4random_uniform(10) + 3)
    setChartValues(count)
  }
  
  func setChartValues(_ count: Int = 10) {
    let values = (0..<count).map { (i) -> ChartDataEntry in
      let val = Double(arc4random_uniform(UInt32(count)) + 3)
      return ChartDataEntry(x: Double(i), y: val)
    }

    let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
    let data =  LineChartDataSet(set1)

    self.lineChartView.data = ChartData(dataSet: data)
  }
  
  }
  

class LeftPaddedTextField: UITextField {
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  
}

extension LeftPaddedTextField {
    func loadDropdownData(data: [String]) {
      let picker = MyPickerView(currencies: data, dropdownField: self)
      self.inputView = picker
    }
}


