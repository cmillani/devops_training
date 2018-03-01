//
//  NetworkClientAssembler.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

protocol MechanismsAssembler {
    func resolve () -> ProductMechanism
}

extension MechanismsAssembler {
    func resolve() -> ProductMechanism {
        return ProductMechanism()
    }
}
