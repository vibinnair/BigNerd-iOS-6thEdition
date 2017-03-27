//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Vibin Nair on 20/03/17.
//  Copyright © 2017 VibinBigNerd. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    //
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    // Initializing a property using a closure;
    var numberFormatter: NumberFormatter = {
        let nf  = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateCelsiusLabel()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            self.fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            self.fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = self.celsiusValue {
            self.celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            self.celsiusLabel.text = "???"
        }
    }
}
