//
//  Resolver.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 30.06.21.
//

import Resolver

extension Resolver {

    public static func registerServices() {

        register { MoviesListStore.shared }
        register { MovieDetailStore.shared }
        
        // Register protocols XYZFetching and XYZUpdating and create implementation object
//        register { XYZCombinedService() }
//            .implements(XYZFetching.self)
//            .implements(XYZUpdating.self)

        // Register XYZNetworkService and return instance in factory closure
//        register { XYZNetworkService(session: resolve()) }

        // Register XYZSessionService and return instance in factory closure
//        register { XYZSessionService() }
    }
    
}
