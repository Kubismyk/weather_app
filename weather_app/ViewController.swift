//
//  ViewController.swift
//  weather_app
//
//  Created by Levan Charuashvili on 30.05.23.
//

import UIKit
import Foundation
import Tabman
import Pageboy

class ViewController:TabmanViewController{
    

    private var viewControllers = [UIViewController(),ViewControllerSecond(),ViewControllerThird()]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.backgroundColor = .none
        addBar(bar, dataSource: self, at: .top)
        let viewWidth: CGFloat = self.view.bounds.width
        let viewHeight: CGFloat = self.view.bounds.height
        let vcCount = viewControllers.count + 1
        let test = round(Double(viewControllers.count)) + 5
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: viewWidth/CGFloat(vcCount) - test, bottom: 0, right: 0)
    }
}



extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = "Page \(index)"
        return TMBarItem(title: title)
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
}
