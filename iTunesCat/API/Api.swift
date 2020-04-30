//
//  Api.swift
//  iTunesCat
//
//  Created by Jose Galindo martinez on 29/04/20.
//  Copyright © 2020 JCG. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class Api: NSObject {
    
    public typealias APIRequestCompleteSuccessClosure = (_ anyObject : Any?) -> Void
    public typealias APIRequestCompleteFailureClosure = (_ reason : Any?) -> Void
    
    // End points
    private let kAPI_SEARCH = "/search"
    
    // Properties
    private var sessionManager : Alamofire.SessionManager
    
    static let shared : Api = {
        let lock = NSRecursiveLock()
        lock.lock()
        let instance = Api()
        lock.unlock()
        return instance
    }()
    
    private override init() {
        self.sessionManager = Alamofire.SessionManager.default
    }
    
    func makeSearch(_ textToSearch : String,
                    onSuccess successBlock : @escaping APIRequestCompleteSuccessClosure,
                    onFailure failureBlock : @escaping APIRequestCompleteFailureClosure) {
        let mUrl = URL(string: "\(Constants.URL_BASE)\(kAPI_SEARCH)")!
        var textConverted = textToSearch.replacingOccurrences(of: " ", with: "+")
        textConverted = textConverted.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let params = ["term" : textConverted]
        self.sessionManager.request(mUrl, method: .get, parameters: params, encoding: URLEncoding.queryString, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["text/javascript"])
            .responseObject { (response : DataResponse<ResponseWrapper>) in
                switch response.result {
                case .success:
                    let wrapper = response.result.value
                    successBlock(wrapper?.createSections())
                    break
                case .failure(let mError):
                    print(mError.localizedDescription)
                    failureBlock(mError)
                    break
                }
        }
    }

}
