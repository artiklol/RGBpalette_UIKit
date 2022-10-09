//
//  ViewController.swift
//  RGBpalette_UIKit
//
//  Created by Artem Sulzhenko on 09.10.2022.
//

import UIKit

class ViewController: UIViewController {

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
        setupSlider()
        setupLabel()
        backgroundСoloring()
    }

    @IBAction func redSliderAction() {
        setupLabel()
        backgroundСoloring()
    }
    
    @IBAction func greenSliderAction() {
        setupLabel()
        backgroundСoloring()
    }
    
    @IBAction func blueSliderAction() {
        setupLabel()
        backgroundСoloring()
    }

    private func setupRgbPalette(){
        rgbPalette.layer.cornerRadius = 15
    }
    
    private func setupSlider(){
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
    }
    
    private func setupLabel(){
        redLabel.text = "Red:    " + String(format: "%.2f", redSlider.value)
        
        greenLabel.text = "Green: " + String(format: "%.2f", greenSlider.value)
        
        blueLabel.text = "Blue:    " + String(format: "%.2f", blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setupTextField(){
        
        
    }
    
    private func backgroundСoloring(){
        rgbPalette.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1))
    }

}

