//
//  APIRequest.swift
//  BinarySwipe
//
//  Created by Yuriy on 6/16/16.
//  Copyright © 2016 EasternPeak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum MainURL: CustomStringConvertible {
    case base
    
    var description: String {
        switch self {
        case .base:
            return "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=200d80e1ee0e4eba9881297b7442aaba"
        }
    }
}

import UIKit
import Alamofire

typealias URLParameters = (url: String, addition: String?)
typealias Body = (path: String?, parameters: Parameters)
typealias EntryParameters = (URLParameters?, HTTPHeaders?, Body?)

protocol EntryParametersPresentable {}

protocol EntryParametersPresenting {
    var entryParameters: EntryParameters { get set }
    init(entryParameters: EntryParameters)
    func parameters() -> EntryParameters
}

extension EntryParametersPresenting where Self: EntryParametersPresentable {
    init(entryParameters: EntryParameters) {
        self.init(entryParameters: entryParameters)
    }
    func parameters() -> EntryParameters {
        return entryParameters
    }
}

struct NewsFeedEntryParams: EntryParametersPresenting, EntryParametersPresentable {
    internal var entryParameters: EntryParameters
}

func requestHandler(_ function: Any, urlRequest: URLRequestConvertible, completionHandler: @escaping (JSON?) -> Void) {
    Logger.log("\n\t url - \(function)", color: .Yellow)
    Alamofire.request(urlRequest)
        .validate()
        .responseJSON { response in
            var errorDescription = ""
            var errorReason = ""
            if case let .failure(error) = response.result {
                if let error = error as? AFError {
                    switch error {
                    case .invalidURL(let url):
                        errorReason = "Invalid URL: " + "\(url) - \(error.localizedDescription)"
                    case .parameterEncodingFailed(let reason):
                        errorDescription = "Parameter encoding failed: " + "\(error.localizedDescription)"
                        errorReason = "Failure Reason: " + "\(reason)"
                    case .multipartEncodingFailed(let reason):
                        errorDescription = "Multipart encoding failed: " + "\(error.localizedDescription)"
                        errorReason = "Failure Reason: " + "\(reason)"
                    case .responseValidationFailed(let reason):
                        errorDescription = "Response validation failed: " + "\(error.localizedDescription)"
                        errorReason = "Failure Reason: " + "\(reason)"
                        
                        switch reason {
                        case .dataFileNil, .dataFileReadFailed:
                            errorDescription = "Downloaded file could not be read"
                        case .missingContentType(let acceptableContentTypes):
                            errorDescription = "Content Type Missing: " + "\(acceptableContentTypes)"
                        case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                            errorDescription = "Response content type: " + "\(responseContentType) " + "was unacceptable: " + "\(acceptableContentTypes)"
                        case .unacceptableStatusCode(let code):
                            errorDescription = "Response status code was unacceptable: " + "\(code)"
                        }
                    case .responseSerializationFailed(let reason):
                        errorDescription = "Response serialization failed: " + "\(error.localizedDescription)"
                        errorReason = "Failure Reason: " + "\(reason)"
                    }
                    
                    errorDescription =  "Underlying error: " + "\(String(describing: error.underlyingError))"
                } else if let error = error as? URLError {
                    errorDescription = "URLError occurred: " + "\(error)"
                } else {
                    errorDescription = "Unknown error: " + "\(error)"
                }
                Logger.log("\tAPI called function - \(function)\n\t" + errorDescription + errorReason, color: .Red)
                completionHandler(nil)
            }
            
            if case let .success(value) = response.result {
                let json = JSON(value)
                Logger.log("\tAPI called function - \(function)\n\tRESPONSE - \(json)\n\tTIMELINE - \(response.timeline)", color: .Green)
                completionHandler(json)
            }
    }
}

func performRequest(_ function: Any, urlRequest: URLRequestConvertible, completion: @escaping (JSON?, Bool) -> Void) {
    requestHandler(function, urlRequest: urlRequest ) { json in
        guard json != nil else {
            completion(nil, false)
            return }
        completion(json, true)
    }
}

enum NewsFeedRequest: URLRequestConvertible {
    
    typealias T = EntryParametersPresenting
    
    case newsFeed(T)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .newsFeed:
                return .get
            }
        }
        
        let headersParam: (HTTPHeaders?) = {
            switch self {
            case .newsFeed:
                return nil
            }
        }()
        
        let url: URL = {
            var relativePath: String = ""
            switch self {
            case .newsFeed(let newPost):
                relativePath = (newPost.entryParameters.0?.0 ?? "")
            }
            return Foundation.URL(string: relativePath)!
        }()
        
        let bodyParams: Body? = {
            switch self {
            case .newsFeed:
                return nil
            }
        }()
        
        Logger.log("API call\n\t url - \(url)\n\t method - \(method)\n\t headerParams - \(headersParam ?? ["":""])\n\t bodyParam - \(bodyParams?.1 ?? ["":""])", color: .Yellow)
        
        return Alamofire.request(url, method: method, parameters: bodyParams?.parameters,
                                 encoding: JSONEncoding.default, headers: headersParam).request!
    }
    
    static func getNewsFeed(_ entry: T, completion: @escaping (JSON?, Bool) -> Void) {
        performRequest(#function, urlRequest: newsFeed(entry), completion: completion)
    }
}


