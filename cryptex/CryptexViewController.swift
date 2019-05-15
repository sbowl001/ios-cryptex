//
//  CryptexViewController.swift
//  cryptex
//
//  Created by Stephanie Bowles on 5/15/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var button: UIButton!
    
    
    var cryptexController = CryptextController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cryptexController.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
//        Create an updateViews() method that takes the currentCryptex's hint and sets the hint label's text to it. It also should reload the components of the picker view. If we don't do this, when a new random cryptex is started, the picker view won't update to show the (potentially) new number of components (e.g. "Foo" has 3 components, but "Cryptex" has 7).
        
        guard let cryptex = cryptexController.currentCryptex else { return }
        label.text = cryptex.hint
        
        pickerView.reloadAllComponents()
    }
    var letters = ["A", "B", "C", "D",
                   "E", "F", "G", "H",
                   "I", "J", "K", "L",
                   "M", "N", "O", "P",
                   "Q", "R", "S", "T",
                   "U", "V", "W", "X",
                   "Y", "Z"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let cryptex = cryptexController.currentCryptex else {return 0}
        
        return cryptex.password.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // For the title of each row, we want to show the letter that corresponds to the row. i.e. row 0 should show "A", row 1 should show "B", etc.
        return letters[row]
    }
    
    func hasMatchingPassword() -> Bool {
        
        guard let currentCryptex = cryptexController.currentCryptex else {return false}
        
        
        //        Get the title of each row (which should be a single letter) in the picker view (try using a for-in loop) and store each one in an array.
        //need a placeholder array?
        var placeholderCharacters: [String] = []
        for i in ....
//        Take the array of letters and combine them into a single string.
        
//        Check if the string matches the model controller's currentCryptex's password, and return a Bool based on their equality.
        
//        NOTE: When comparing strings, the letter "A" and "a" do not equal each other. To accurately check equality between the two strings, either make them both uppercased or lowercased, then check.
        
        //answer would be a combined array
        let answer = placeholderCharacters.joined()
        if answer.lowercased() == currentCryptex.password.lowercased() {return true}
        else {return false}
        
        
        
    }
    var countdownTimer : Timer?
    
    func reset() {
        //        Invalidate the old timer if there is one to ensure you don't present an alert saying the user ran out of time when they actually haven't. (This will make more sense later on)
        
//        countdownTimer?.invalidate()
//        countdownTimer = nil
        
//        Create a new timer and set the value of countdownTimer to it. Use the Timer.scheduledTimer(withTimeInterval: convenience method to do this. Make the time interval 60 seconds. For now, add a print statement in the handler of the timer that says the timer is finished. We'll come back and add some real code to it later on.
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false, block: <#T##(Timer) -> Void#>) {
            
        }
//            Optionally, you can also reset the picker view's components back to "A" using the pickerView.selectRow method. You will have to loop through each character in the password to reset each component. This is not required, but it's a nice feature to add.
        
        
        
//        This presentNoTimeRemainingAlert() should be called in the handler of the Timer.scheduledTimer method call in the reset() method. You can get rid of the print statement if you wish.
    }
    
    func newCryptexAndReset() {
//        Call the cryptexController's randomCryptex() method.
        cryptexController.randomCryptex()
//        Call updateViews() to make sure the picker view has the right number of components for the new password, and the new hint shows in the label.
        updateViews()
//        Call reset() to reset the timer.
        reset()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
//        In the action of the unlock button, use the hasMatchingPassword() method to ascertain whether the user has guessed the password correctly or not, and present an alert controller using one of the two methods above depending on the boolean value returned from hasMatchingPassword().
        if hasMatchingPassword() {
            presentCorrectPasswordAlert()
        }
        else {
            presentIncorrectPasswordAlert()
        }
        
    }
    
    func  presentCorrectPasswordAlert() {
//        Set up an alert controller with a message telling the user that they have correctly guessed the password
        let correctAlert = UIAlertController(title: "Correct", message: "You answered correctly", preferredStyle: .alert)
//        Add an action to the alert controller that lets them attempt a new cryptex.
        correctAlert.addAction(UIAlertAction(title:"New Cryptex" , style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
//        You've already done the work of resetting everything with a new cryptex. All you need to do is call newCryptexAndReset() in the handler of the action.
//        Present the alert controller.
        
        present(correctAlert, animated: true)
    }
    
    func presentIncorrectPasswordAlert(){
        
        //        Set up an alert controller with a message telling the user that they have incorrectly guessed the password
        let incorrectAlert = UIAlertController(title: "Incorrect", message: "That is incorrect", preferredStyle: .alert)
        
//        Add an action to the alert controller that lets them continue guessing the password. This doesn't need a handler, as all we need to do is dismiss the alert controller.
        
        incorrectAlert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        
        
//        Add an action to the alert controller that lets them attempt a new cryptex.
        incorrectAlert.addAction(UIAlertAction(title: "Try new cryptext", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
        
//        Like the previous alert method, call newCryptexAndReset() in the handler of this action.
//        Present the alert controller.
    }
    
    func presentNoTimeRemainingAlert() {
//        Set up an alert controller telling the user that they have ran out of time to guess the password, and ask them whether they would like to reset the timer and keep guessing or try a new cryptex.
        let noTimeAlert = UIAlertController(title: "Out of time", message: "You have run out of time", preferredStyle: .alert)
//        Add an action that lets them reset the timer. What method have you already made that would accomplish this without changing the cryptex?
        noTimeAlert.addAction(UIAlertAction(title: "Reset Timer", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
        
//        Add an action that lets them try a new cryptex. What method have you already made that would reset the timer and change to a new cryptex?
        
        noTimeAlert.addAction(UIAlertAction(title: "Try new cryptex", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
//        Present the alert controller.
        
        present(noTimeAlert, animated: true)
    }
    

}
