//
//  ProductDaoAssembler.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

protocol DAOAssembler {
    func resolve() -> ProductDAOProtocol
}

extension DAOAssembler {
    func resolve() -> ProductDAOProtocol {
        return ProductDAO()
    }
}
