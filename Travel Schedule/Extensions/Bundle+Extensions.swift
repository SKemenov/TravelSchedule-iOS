//
//  Bundle+Extensions.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import Foundation

extension Bundle {
    public var appBuild: String {
        getInfo("CFBundleVersion")
    }

    public var appVersionLong: String {
        getInfo("CFBundleShortVersionString")
    }

    private func getInfo(_ str: String) -> String {
        infoDictionary?[str] as? String ?? ""
    }
}
