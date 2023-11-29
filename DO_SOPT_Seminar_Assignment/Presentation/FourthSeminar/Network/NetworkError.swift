//
//  NetworkErro.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/15.
//

import Foundation

enum NetworkError: Int, Error, CustomStringConvertible {
    var description: String { self.errorDescription }
    case responseError
    case unknownError
    case loginFailed = 400
    case notFoundError = 404
    case internalServerError = 500
    
    var errorDescription: String {
        switch self {
        case .responseError: return "RESPONSE_ERROR"
        case .unknownError: return "UNKNOWN_ERROR"
        case .loginFailed: return "로그인에 실패하였습니다."
        case .notFoundError: return "404:NOT_FOUND_ERROR"
        case .internalServerError: return "500:INTERNAL_SERVER_ERROR"
        }
    }
}
