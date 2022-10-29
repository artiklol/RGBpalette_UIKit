//
//  mainViewController.swift
//  RGBpalette_UIKit
//
//  Created by Artem Sulzhenko on 29.10.2022.
//

import UIKit

class mainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! editViewController
        colorVC.colorMainVC = view.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as! editViewController
        colorVC.delegate = self
        colorVC.updatingValuesRGB()
    }

}

extension mainViewController: ColorDelegate{
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
