//
//  PageViewController.swift
//  Onboarding Walkthrough
//
//  Created by mac on 4/28/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import Foundation



struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    func makeUIViewController(context: Context) -> UIPageViewController{
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
         controllers.forEach({$0.view.backgroundColor = UIColor(named: "bgColor") })
        pageViewController.view.backgroundColor = UIColor(named: "bgColor")
        return pageViewController
    }
    func updateUIViewController(_ pageViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageViewController>){
        pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
    }
    
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        init(_ controller: PageViewController) {
            self.parent = controller
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return nil
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index  = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == parent.controllers.count - 1{
                return nil
            }
                      
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
    
    
    
    
    
    func makeCoordinator() -> PageViewController.Coordinator {
           Coordinator(self)
       }
    
    
}

struct PageViewContainer<T: View>  : View {
    
    var viewControllers: [UIHostingController<T>]
    @State var currentPage = 0
    
    var body: some View {
        
        return VStack {
            
            PageViewController(controllers: viewControllers, currentPage: self.$currentPage)
            
            PageIndicator(currentIndex: self.currentPage)
               
            LCButton(text: currentPage == viewControllers.count - 1 ? "Get started" : "Next") {
                if self.currentPage < self.viewControllers.count - 1{
                    self.currentPage += 1
                }
            }.padding()
            
            
        } .background(Image("background1"))
        .padding()
    }
}

struct PageViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        PageViewContainer(viewControllers: Page.getAll.map({  UIHostingController(rootView: PageView(page: $0) )  }))
    }
}


