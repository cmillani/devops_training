//
//  Assembler.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

protocol Assembler: MechanismsAssembler, DAOAssembler { }

class DevOpsAssembler: Assembler {
    
#if TEST
    static var shared: Assembler = TestDevOpsAssembler()
#else
    static var shared: Assembler = DevOpsAssembler()
#endif
    private init() { }
}
