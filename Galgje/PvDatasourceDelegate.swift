//
//  PvDatasourceDelegate.swift
//  Galgje
//
//  Created by docent on 17/11/2021.
//

import Foundation
import UIKit

class PvDatasourceDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource
{
    var pvData = ["-", "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerView.tag
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pvData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pvData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedLetter = pickerView[row]
        print(yearValueSelected)
    }
    
    
    func getLetter(index: Int) -> String
    {
        
    }
    func rowForString(letter:String) -> Int
    {
        
    }
    
    
}
