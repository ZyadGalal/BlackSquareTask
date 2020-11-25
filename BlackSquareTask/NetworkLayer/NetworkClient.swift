//
//  NetworkClient.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation
import Alamofire
class NetworkClient{
    typealias onSuccess<T> = (T) -> ()
    typealias onFailure = (_ errorMessage : String)->()
    
    static func performRequest<T> (_type:T.Type ,router : APIRouter , completion : @escaping (Swift.Result<T,Error>) -> ()) where T : Decodable{
        AF.request(router).responseJSON { (response) in

            switch response.result{
            case .success(_) :
                do{
                    let response = try JSONDecoder().decode(T.self, from: response.data!)
                    completion(.success(response))
                }
                catch let error{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
