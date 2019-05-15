//
//  CryptexViewController.swift
//  cryptex
//
//  Created by Stephanie Bowles on 5/15/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pickerView: CryptexPicker!
    
    @IBOutlet weak var button: UIButton!
    
    
    var cryptexController = CryptextController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cryptexController.delegate = self
//        pickerView.delegate = self
//        pickerView.dataSource = self
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
//        Create an updateViews() method that takes the currentCryptex's hint and sets the hint label's text to it. It also should reload the components of the picker view. If we don't do this, when a new random cryptex is started, the picker view won't update to show the (potentially) new number of components (e.g. "Foo" has 3 components, but "Cryptex" has 7).
        
        guard let cryptex = cryptexController.currentCryptex else { return }
        label.text = cryptex.hint
        
        pickerView.reloadAllComponents()
    }

    @IBAction func buttonTapped(_ sender: Any) {
    }
    

}
