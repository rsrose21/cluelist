//
//  AppDelegate.swift
//  ClueList
//
//  Created by Ryan Rose on 10/12/15.
//  Copyright © 2015 GE. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var sharedContext: NSManagedObjectContext {
        return CoreDataManager.sharedInstance.managedObjectContext
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Change navigation bar color: https://coderwall.com/p/dyqrfa/customize-navigation-bar-appearance-with-swift
        let navigationBarAppearace = UINavigationBar.appearance();
        
        navigationBarAppearace.tintColor = UIColor(hexString: "#ffffffff")
        navigationBarAppearace.barTintColor = UIColor(hexString: "#6F5499ff")
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        //change status bar color
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        let dataHelper = DataHelper()
        dataHelper.seedDataStore()
        dataHelper.printAllToDos()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.sharedInstance.saveContext()
    }

    

}

