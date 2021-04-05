//
//  AppDelegate.swift
//  ImageViewerCollectionView
//
//  Created by Sandeep on 26/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var vm = CollectionViewImageViewerVM() as! ImageViewerVM
        var vc = CollectionViewImageViewerUIVC() as! ImageViewerUIVC
        let firstVc = UIStoryboard(name: "ImageViewer", bundle: .main).instantiateViewController(identifier: "ImageViewerVC") as! ImageViewerVC
        firstVc.imageViewerVM = vm
        firstVc.imageViewerUIVC = vc
        AppDelegate().shared().window?.rootViewController = firstVc
        AppDelegate().shared().window?.makeKeyAndVisible()
        vm.view = firstVc
        vc.view = firstVc
        return true
    }
    func shared() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
}

