//
//  AppDelegate.swift
//  iphone photo app clone
//
//  Created by Georgiy on 23.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// MARK: - UIViewController settings -
        let mediaLibraryViewController = UIViewController()
        mediaLibraryViewController.view.backgroundColor = .systemRed
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                      image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                      tag: 0)

        let forYouViewController = UIViewController()
        forYouViewController.view.backgroundColor = .systemGreen
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                       image: UIImage(systemName: "heart.text.square.fill"),
                                                       tag: 1)

        let photoGalleryViewController = PhotoGalleryViewController()
        photoGalleryViewController.view.backgroundColor = .white
        photoGalleryViewController.tabBarItem = UITabBarItem(title: "Альбомы",
                                                      image: UIImage(systemName: "rectangle.stack.fill"),
                                                      tag: 2)

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .systemYellow
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                     image: UIImage(systemName: "magnifyingglass"),
                                                     tag: 3)

// MARK: - UINavigationController settings -
        var navigationPhotoGalleryController = UINavigationController()
        navigationPhotoGalleryController = UINavigationController(rootViewController: photoGalleryViewController)
        navigationPhotoGalleryController.navigationBar.prefersLargeTitles = true
        navigationPhotoGalleryController.navigationBar.isTranslucent = true
        let appearanceNavBar = UINavigationBarAppearance()
        appearanceNavBar.backgroundColor = .white //цвет верхней шторки
        photoGalleryViewController.navigationController?.navigationBar.scrollEdgeAppearance = appearanceNavBar
        photoGalleryViewController.title = "Альбомы"

// MARK: - UITabBarController settings -
        let appearance = UITabBarAppearance()
        let tapBarController = UITabBarController()
        tapBarController.tabBar.standardAppearance = appearance
        tapBarController.tabBar.scrollEdgeAppearance = appearance
        tapBarController.setViewControllers([
            mediaLibraryViewController,
            forYouViewController,
            navigationPhotoGalleryController,
            searchViewController
        ], animated: true)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()

        return true
    }


}

