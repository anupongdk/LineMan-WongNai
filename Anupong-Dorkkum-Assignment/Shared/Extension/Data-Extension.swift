//
//  Data-Extension.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 21/7/2567 BE.
//

import Foundation

extension Data {
    func decode<T: Decodable>() -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}
