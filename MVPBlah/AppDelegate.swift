//
//  AppDelegate.swift
//  MVPBlah
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import UIKit
import RxSwift
import MockWebServer
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static let USE_IMMEDIATE_SCHEDULERS = "USE_IMMEDIATE_SCHEDULERS"
    static let USE_MOCK_WEB_SERVER = "USE_MOCK_WEB_SERVER"

    var jokesRepository : JokesRepository?
    var schedulerManager : SchedulerManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if useImmediateSchedulers {
            schedulerManager = SchedulerManager(computation: MainScheduler(), main:MainScheduler())
        }
        else
        {
           schedulerManager = SchedulerManager(computation: ConcurrentDispatchQueueScheduler(qos: .default), main:MainScheduler())
        }

        if useMockWebServer {
            jokesRepository = JokesRepository(baseUrl: "http://127.0.0.1:9000",
                                              jokesProvider: RxMoyaProvider<JokesService>(stubClosure: MoyaProvider.immediatelyStub))
        }
        else
        {
            jokesRepository = JokesRepository(baseUrl: "https://api.icndb.com",
                                              jokesProvider: RxMoyaProvider<JokesService>())
        }


        if let firstViewController = window?.rootViewController as? JokesViewController {
            firstViewController.schedulerManager = schedulerManager
        }
        
        return true
    }
    
    private var useImmediateSchedulers: Bool {
        return ProcessInfo.processInfo.environment[AppDelegate.USE_IMMEDIATE_SCHEDULERS] == "YES"
    }
    private var useMockWebServer: Bool {
        return ProcessInfo.processInfo.environment[AppDelegate.USE_MOCK_WEB_SERVER] == "YES"
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

