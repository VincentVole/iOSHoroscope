//
//  InfoViewController.swift
//  horoscope
//
//  Created by Vincent Vole on 9/20/17.
//  Copyright © 2017 Vincent Vole. All rights reserved.
//

import UIKit
import SwiftyJSON

class InfoViewController: UIViewController, UITabBarDelegate {
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var todayButton: UITabBarItem!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    
    var sign: String? = "libra"
    var horoscope: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.delegate = self
        self.signLabel.text = "Horoscope for \(sign!)"
        
        HoroscopeModel.getHoroscope(sign: sign!, timeFrame: "today", completionHandler: {
            data, response, error in
            let result = JSON(data)
            DispatchQueue.main.async {
                self.tabBar.selectedItem = self.todayButton
                self.dateLabel.text = self.todayButton.title
                self.horoscopeLabel.text = result["horoscope"].string
            }
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        dateLabel.text = item.title
        
        HoroscopeModel.getHoroscope(sign: sign!, timeFrame: item.title!.lowercased(), completionHandler: {
            data, response, error in
            let result = JSON(data)
            DispatchQueue.main.async {
                print(result)
                self.horoscopeLabel.text = result["horoscope"].string
            }
        })
    }
    
    
    func stripString(str: String){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
