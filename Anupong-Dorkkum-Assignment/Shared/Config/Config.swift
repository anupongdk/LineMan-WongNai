//
//  Config.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 20/7/2567 BE.
//

import Foundation

struct Config {
    static var baseURL: URL {
        guard let baseURLString = Bundle.main.object(forInfoDictionaryKey: "baseURL") as? String,
              let url = URL(string: baseURLString) else {
            fatalError("baseURL is not set in Info.plist or it is invalid")
        }
        return url
    }
}
