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
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            self.celsiusLabel.text = textField.text
        } else {
            self.celsiusLabel.text = "???"
        }
    }
}
