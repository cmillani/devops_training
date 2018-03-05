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
    
    static var shared: Assembler = DevOpsAssembler()
    
    private init() { }
}


class TesteAssembelr: Assembler {
    
}

extension DAOAssembler where Self: TesteAssembelr {
    
}

extension TesteAssembelr: DAOAssembler {
    
}
