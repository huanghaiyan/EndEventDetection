//
//  ViewController.swift
//  EndEventDetection
//
//  Created by 黄海燕 on 16/4/24.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRectMake(50, 50, 200, 200)
        let imageView = UIImageView(frame:rect)
        let image = UIImage(named: "1.jpg")
        
        imageView.image = image
        //设置图像的标识值，以便后期对图像视图的调用
        imageView.tag = 1
        self.view.addSubview(imageView)
        //初始化一个按钮对象，当点击按钮是开始播放动画
        let button = UIButton(type:UIButtonType.System)
        button.frame = CGRectMake(50, 400, 220, 44)
        button.backgroundColor = UIColor.lightGrayColor()
        button.setTitle("tap", forState: UIControlState.Normal)
        //给按钮对象，绑定点击事件
        button.addTarget(self, action: "playAnimation", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
    }
    func playAnimation(){
        //发出开始视图动画的请求，标志着视图动画块的开始。在它和提交动画请求之间，可以定义动画的各种展现方式
        UIView.beginAnimations(nil, context: nil)
        //设置动画的播放速度为淡入淡出
        UIView.setAnimationCurve(.EaseInOut)
        UIView.setAnimationDuration(5)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        let view = self.view.viewWithTag(1)
        //设置动画的类型为翻转动画
        UIView.setAnimationTransition(.FlipFromRight, forView: view!, cache: true)
        //设置视图的目标位置为（50，50），目标尺寸（0，0）。即视图在进行翻转动画的同时，将移动到目标位置，并缩小至不可见的状态
        view?.frame = CGRectMake(50, 50, 0, 0)
        //同时设置动画的代理对象，为当前的视图控制器类，当前动画结束后，在控制器后台打印输出日志。
        UIView.setAnimationDelegate(self)
        //设置动画结束时，执行的方法
        UIView.setAnimationDidStopSelector("animationStop")
        UIView.commitAnimations()
    }
    //设置一个方法，用来响应动画结束事件
    func animationStop(){
        print("animation stop")
        //同时将视图对象，从父视图中移除
        self.view.viewWithTag(1)?.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

