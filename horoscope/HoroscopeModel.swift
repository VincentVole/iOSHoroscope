//
//  HoroscopeModel.swift
//  horoscope
//
//  Created by Vincent Vole on 9/20/17.
//  Copyright © 2017 Vincent Vole. All rights reserved.
//

import Foundation

import Foundation
class HoroscopeModel {
    static func getToday(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        // Specify the url that we will be sending the GET Request to
        let url = URL(string: "http://horoscope-api.herokuapp.com/horoscope/today/libra")
        // Create a URLSession to handle the request tasks
        let session = URLSession.shared
        // Create a "data task" which will request some data from a URL and then run the completion handler that we are passing into the getToday function itself
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        // Actually "execute" the task. This is the line that actually makes the request that we set up above
        task.resume()
    }
}
