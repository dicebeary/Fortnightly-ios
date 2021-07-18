//
//  AppDelegate.swift
//  Fortnightly
//
//  Created by Vajda Kristóf on 2021. 07. 16..
//

import UIKit
import Core
import Domain
import RxSwift
import Swinject
import SwinjectStoryboard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let bag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        // Register DI
        let container = Container()
        let assembler = Assembler(container: container)
        assembler.apply(assemblies: assemblies)
        SwinjectStoryboard.defaultContainer = container

        // Initial navigation
        let sb = SwinjectStoryboard.create(
            name: "Main", bundle: nil, container: container)
        if let controller = sb.instantiateViewController(withIdentifier: "MainNav") as? UINavigationController {
            window?.rootViewController = controller
        }

        return true
    }

}

// MARK: - Assemblies
extension AppDelegate {
    var assemblies: [Assembly] {
        return [
            CoreNewsAssembly(),
            ScreenAssembly()
        ]
    }
}
