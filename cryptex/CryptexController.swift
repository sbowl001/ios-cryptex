//
//  CryptexController.swift
//  cryptex
//
//  Created by Stephanie Bowles on 5/15/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation


class CryptextController  {
    private(set) var cryptexes : [Cryptex] = [Cryptex(password: "hello", hint: "first greeting"),
                                              Cryptex(password: "macau", hint: "current city")]
    
    //    We need to start the app off with a new cryptex for the user to solve. Since the currentCryptex is optional, it won't have a value to start with. We can call the randomCryptex() method in a few places to give it a value. Perhaps the cleanest way is to use the CryptexController's initializer. As soon as we create an instance of CryptexController the initializer gets called and we can run the randomCryptex() method inside it. The initializer doesn't need any arguments. It should look like this:
    init() {
        randomCryptex()
        
    }
    //    Create a property called currentCryptex that is of type Cryptex?. This is the property that the view controller will be able to see (as it is not private), and use for setting up the picker view, and running some game logic.
    var currentCryptex: Cryptex?
//    Create a function called randomCryptex(). This method should grab a random Cryptex from the cryptexes array and set the value of currentCryptex to it. As of Swift 4.2, there is a very easy way to do this. If you're unsure of what it is, refer to Array in the documentation.
    
    func randomCryptex() {
        currentCryptex = cryptexes.randomElement()
    }
    
    
}
