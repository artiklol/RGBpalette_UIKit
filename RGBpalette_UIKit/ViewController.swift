//
//  ViewController.swift
//  RGBpalette_UIKit
//
//  Created by Artem Sulzhenko on 09.10.2022.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var rgbPalette: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        rgbPalette.layer.cornerRadius = 15

        setupSlider(slider: redSlider, color: .red)
        setupSlider(slider: greenSlider, color: .green)
        setupSlider(slider: blueSlider, color: .blue)
        
        setupKeyboard(textField: redTextField)
        setupKeyboard(textField: greenTextField)
        setupKeyboard(textField: blueTextField)
        
        setValueForLabel()
        setValueForTextField()
        
        updatingValuesRGB()
    }
    
    @IBAction func redSliderAction() {
        redLabel.text = string(from: redSlider)
        redTextField.text = string(from: redSlider)
        updatingValuesRGB()
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = string(from: greenSlider)
        greenTextField.text = string(from: greenSlider)
        updatingValuesRGB()
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = string(from: blueSlider)
        blueTextField.text = string(from: blueSlider)
        updatingValuesRGB()
    }
    
    private func updatingValuesRGB(){
        rgbPalette.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: CGFloat(1))
    }
    
    private func setValueForLabel() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    private func setValueForTextField() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    private func setupSlider(slider: UISlider, color: UIColor?){
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .white
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
        }else {
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
        
        setValueForLabel()
        setValueForTextField()
        updatingValuesRGB()
    }
}


extension ViewController {
    
    private func setupKeyboard(textField: UITextField){
        textField.delegate = self
        textField.keyboardType = .decimalPad
        
        let bar = UIToolbar()
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                   action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        bar.items = [flexibleSpace,done]
        bar.sizeToFit()
        
        textField.inputAccessoryView = bar
    }
    
    @objc private func donePressed() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
