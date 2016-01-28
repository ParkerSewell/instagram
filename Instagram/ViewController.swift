//
//  ViewController.swift
//  Instagram
//
//  Created by Joanna Meyer on 1/28/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let apiKey = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=e05c462ebd86446ea48a5af73769b602api_key=\(apiKey)")
        
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            
                            print("response: \(responseDictionary)")
                            //hide HUD
                       
                            //MBProgressHUD.hideHUDForView(self.view, animated: true)
                            
                           // self.movies = responseDictionary["results"] as? [NSDictionary]
                            //self.tableView.reloadData()
                      
                            
                            
                    }
                }
        });
        task.resume()
        

                    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

