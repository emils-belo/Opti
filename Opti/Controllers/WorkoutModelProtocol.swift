//
//  DateReferenceProtocol.swift
//  Opti
//
//  Created by Emils Beloglazovs on 2020-01-18.
//  Copyright © 2020 Emils Beloglazovs. All rights reserved.
//

import Foundation

protocol WorkoutModel: Codable {
    var dateReference: Double { get }
    var title: String { get }
}
