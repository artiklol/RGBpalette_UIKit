//
//  ViewController.swift
//  RGBpalette_UIKit
//
//  Created by Artem Sulzhenko on 09.10.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
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
       
        setupRgbPalette()

        setupSlider(slider: redSlider, color: .red)
        setupSlider(slider: greenSlider, color: .green)
        setupSlider(slider: blueSlider, color: .blue)
        
        setupKeyboard(textField: redTextField)
        setupKeyboard(textField: greenTextField)
        setupKeyboard(textField: blueTextField)
        
        updatingValuesRGB()
    }
    
    @IBAction func redSliderAction() {
        updatingValuesRGB()
    }
    
    @IBAction func greenSliderAction() {
        updatingValuesRGB()
    }
    
    @IBAction func blueSliderAction() {
        updatingValuesRGB()
    }
    
    private func setupRgbPalette(){
        rgbPalette.layer.cornerRadius = 15
    }
    
    private func setupSlider(slider: UISlider, color: UIColor?){
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
        slider.maximumTrackTintColor = .lightGray
        slider.thumbTintColor = .white
    }
    
    private func updatingValuesRGB(){
        redLabel.text = "Red:    " + String(format: "%.2f", redSlider.value)
        greenLabel.text = "Green: " + String(format: "%.2f", greenSlider.value)
        blueLabel.text = "Blue:    " + String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        rgbPalette.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: CGFloat(1))
    }
    
    private func setupKeyboard(textField: UITextField){
        textField.delegate = self
        textField.keyboardType = .decimalPad
        
        //add ToolBar and button "Done"
        let bar = UIToolbar()
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                   action: #selector(donePressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        bar.items = [flexibleSpace,done]
        bar.sizeToFit()
        
        textField.inputAccessoryView = bar
    }
    
    private func inputValuesKeyboard(textField: UITextField, slider: UISlider){
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            slider.value = currentValue
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputValuesKeyboard(textField: redTextField, slider: redSlider)
        inputValuesKeyboard(textField: greenTextField, slider: greenSlider)
        inputValuesKeyboard(textField: blueTextField, slider: blueSlider)
        
        updatingValuesRGB()
        view.endEditing(true)
    }
    
    @objc func donePressed(){
        inputValuesKeyboard(textField: redTextField, slider: redSlider)
        inputValuesKeyboard(textField: greenTextField, slider: greenSlider)
        inputValuesKeyboard(textField: blueTextField, slider: blueSlider)
        
        updatingValuesRGB()
        view.endEditing(true)
    }
    
}
