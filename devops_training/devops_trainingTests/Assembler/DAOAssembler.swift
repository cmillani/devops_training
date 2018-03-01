//
//  DAOAssembler.swift
//  devops_trainingTests
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

@testable import devops_training

extension DAOAssembler where Self: TestDevOpsAssembler {
    func resolve() -> ProductDAOProtocol {
        return TestProductDAO()
    }
}
