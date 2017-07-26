//
//  RequestApi.swift
//  Beers
//
//  Created by Lucas Domingos on 15/07/17.
//  Copyright © 2017 Lucas Domingos. All rights reserved.
//

import Foundation


class RequestApi {
    
    // MARK: - Properties
    let network = NetworkApi()
    var cities : [Beer] = []
    
    // MARK: - Methods
    func requestBeers(completionHandler : @escaping ([Beer]) -> Void){
        Alamofire.request(network.URL).responseArray { (response: DataResponse<[Beer]>) in
            let beerApiResponse = response.result.value
            
            guard let apiResponse = beerApiResponse else{
                return
            }
            
            completionHandler(apiResponse)
        }
    }
    
    func requestPhoto(url: String, completionHandler : @escaping (UIImage) -> Void){
        Alamofire.request(url).responseData { response in
            guard let data = response.result.value else { return }
            completionHandler(UIImage(data: data)!)
        }
    }
    
}
