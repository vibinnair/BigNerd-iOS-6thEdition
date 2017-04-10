import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
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
    
    
    // UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        let replacementTextHasAlphabets = string.rangeOfCharacter(from: NSCharacterSet.letters)
        if existingTextHasDecimalSeperator != nil, replacementTextHasDecimalSeperator != nil {
            return false
        } else if replacementTextHasAlphabets != nil {
            return false
        } else {
            return true
        }
    }
}
