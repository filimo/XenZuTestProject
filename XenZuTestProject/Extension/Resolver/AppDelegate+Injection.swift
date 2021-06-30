//
//  AppDelegate+Injection.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 30.06.21.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerNetworkServices()
        registerServices()
    }
}
