//
//  ViewController.swift
//  DataProtection
//
//  Created by 山本響 on 2023/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    private func secureSave(text: String, to fileURL: URL) -> Bool {
        guard let data = text.data(using: .utf8) else {
            return false
        }
        do {
            try data.write(to: fileURL, options: [.completeFileProtection])
        } catch {
            print(error)
            return false
        }
        
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let text = "Super secret text"
        
        if let fileURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension("protectedData.txt") {
            let result = secureSave(text: text, to: fileURL)
            
            let message = result ? "Save completed successfully" : "Saved Failed"
            print(message)
            
        }
    }


}

