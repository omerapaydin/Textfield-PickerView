//
//  ViewController.swift
//  Textfield&PickerView
//
//  Created by Ömer on 20.03.2025.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerView:UIPickerView!
    var ulkeler: [String] = ["Türkiye", "Asya", "Afrika", "Antarktika"]
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
        
        
        let toolbar = UIToolbar()
        toolbar.tintColor = .systemBlue
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(tamamButtonTapped))
        
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(iptalButtonTapped))
        
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([iptalButton,boslukButton,tamamButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = ulkeler[row]
    }
    
    @objc func tamamButtonTapped() {
        textField.text = ""
        textField.placeholder = "Lütfen Seçiniz"
        view.endEditing(true)
    }
    
    @objc func iptalButtonTapped() {
        view.endEditing(true)
    }
    
    


}

