//
//  App242App.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_rwdAaFYLjxgNquGRKBhH1rHRfg1khV")
        
        notificationsGetStarted()

        OneSignal.initialize("4f00a766-98d4-4bda-892b-1d6f335cd322", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("286c3dda36cff8dbbf8c9e5f7a42dc69")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())

        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    var url = "https://onesignal-ba.com/api/os/y7v99Q4BIbWYqayhGSwt/\(Apphud.userID())"
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App242App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
