//
//  ViewController.swift
//  horoscope
//
//  Created by Vincent Vole on 9/20/17.
//  Copyright © 2017 Vincent Vole. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBAction func accessApi(_ sender: UIButton) {
        HoroscopeModel.getToday(completionHandler: {
            data, response, error in
            let result = JSON(data!)
            print(result)
            print(result["horoscope"])
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

