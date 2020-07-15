//
//  SwiftUI_KitApp.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

#if os(iOS)
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
//            setNavBarColors()
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
#endif
@main
struct MainApp {
    static func main() {
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            SwiftUI_KitApp.main()
        } else {
            #if os(iOS) // iOS 13.0 or lower
            UIApplicationMain(CommandLine.argc,
                              CommandLine.unsafeArgv,
                              nil,
                              NSStringFromClass(AppDelegate.self))
            #else
            // So we are on macOS 10.15, tvOS 13.0, watchOS 6.0 or someting lower.
            // By correctly setting the deployment target in your project,
            // you won't need to do someting here, as this situation will
            // never occur.
            print("This app doesn't run (yet) on this OS, so Bye")
            return
            #endif
        }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct SwiftUI_KitApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ContentView().frame(minWidth: 100, idealWidth: 300, maxWidth: .infinity, minHeight: 100, idealHeight: 200, maxHeight: .infinity)
            #else
            ContentView()
            #endif
        }
    }
}

