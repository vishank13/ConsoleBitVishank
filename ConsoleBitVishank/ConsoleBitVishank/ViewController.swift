//
//  ViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 02/11/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let headers: HTTPHeaders = [
                "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3NTU0MzE5LCJqdGkiOiJkNzJjNjA3ZDViMjM0ZWM5YWQwNmUzNmZkMzM2Y2NlYiIsInVzZXJfaWQiOjN9.6b3aCkpLv2YqE1fHsHP6zj9byKFzQEd7WRKRgjfzxVI"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LoginViewModel().validateUser(with: "test@example.com", password: "testing@example") { response in
            guard let user = response.user else {return }
            print(user)
        }
//        AF.request(url2, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseDecodable(of: Welcome2.self) { (response) in
//            print(response)
//            switch response.result {
//            case .success:
//                guard let films = response.value else { return }
//                print(films.count)
////                self.user = films
//            case .failure:
//                print(Error.self)
//            }
//          }
        
        
        
//        {
//            response in
//            switch (response.result) {
//            case .success:
//                print(response)
//                self.user = try? JSONDecoder().decode(Welcome.self, from: response.value as! Data)
//                print(self.user?.user)
//                break
//            case .failure:
//                print(Error.self)
//            }
//        }
    }
    
}



