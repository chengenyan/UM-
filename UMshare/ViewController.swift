//
//  ViewController.swift
//  UMshare
//
//  Created by apple on 2017/4/13.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnclick(_ sender: Any) {
    
        //判断是否装了应用的
      //  UMSocialUIManager.addCustomPlatformWithoutFilted(UMSocialPlatformType.sina, withPlatformIcon: UIImage.init(named: "充值余额"), withPlatformName: "新浪微博")
        //  UMSocialPlatformType_Sina               = 0, //新浪
//        UMSocialPlatformType_WechatSession      = 1, //微信聊天
//        UMSocialPlatformType_WechatTimeLine     = 2,//微信朋友圈
//        UMSocialPlatformType_WechatFavorite     = 3,//微信收藏
//        UMSocialPlatformType_QQ                 = 4,//QQ聊天页面
//        UMSocialPlatformType_Qzone              = 5,//qq空间
//        UMSocialPlatformType_TencentWb          = 6,//腾讯微博
        //UMSocialPlatformType_Sms                = 13,//短信
          var platarr:NSArray=[1,2,4,5,13]
        if UIApplication.shared.canOpenURL(URL.init(string: "sinaweibo://")!) {
            platarr=[1,2,4,5,0,13]
        }
        UMSocialUIManager.setPreDefinePlatforms(platarr as! [Any])
        UMSocialUIManager.showShareMenuViewInWindow{ (UMSocialPlatformTypestr, array) in
            print("分享面板")
            switch UMSocialPlatformTypestr {
            case UMSocialPlatformType.wechatSession:
                print("微信")
            case UMSocialPlatformType.wechatTimeLine:
                print("微信朋友圈")
            case UMSocialPlatformType.QQ:
                print("QQ")
            case UMSocialPlatformType.qzone:
                print("QQ空间")
            case UMSocialPlatformType.sina:
                print("新浪微博")
            case UMSocialPlatformType.sms:
                print("短信")
            default :
                print("没有")
            }
         //   let UMSocialPlatform:UMSocialPlatformType=UMSocialPlatformTypestr as UMSocialPlatformType
            self.sharewebPageToPlatformType(UMSocialPlatformTypestr)
            
        }
      

       /* UMSocialUIManager.showShareMenuViewInWindow { (UMSocialPlatformTypestr, array) in
            print("分享面板")
            switch UMSocialPlatformTypestr {
            case UMSocialPlatformType.wechatSession:
                print("微信")
            case UMSocialPlatformType.wechatTimeLine:
                print("微信朋友圈")
            case UMSocialPlatformType.QQ:
                print("QQ")
            case UMSocialPlatformType.qzone:
                print("QQ空间")
            case UMSocialPlatformType.sina:
                print("新浪微博")
            case UMSocialPlatformType.sms:
                print("短信")
            default :
                print("没有")
            }
            
        }*/
    }
    func sharewebPageToPlatformType(_ platformType:UMSocialPlatformType)  {
        
      let messageObject=UMSocialMessageObject.init()
        let thumurl="https://mobile.umeng.com/images/pic/home/social/img-1.png"
      let shareObject = UMShareWebpageObject.shareObject(withTitle: "欢迎使用【友盟+】社会化组件U-Share", descr: "欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！", thumImage: thumurl)
        //
        shareObject?.webpageUrl="http://www.autohome.com.cn/news/201702/898695.html#pvareaid=2023111"//;url就是你要分享的网址
        messageObject.shareObject=shareObject
        UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self) { (data, error) in
            if (error != nil) {
                
                /**
                 *  根据等级打印日志
                 *
                 *  @param flagString  控制打印分级的标志字符串
                 *  @see  below  UMSocialLogClosedFlagString...and so on
                 *  @param file        打印日志的文件
                 *  @param function    打印日志的函数
                 *  @param line        打印的日志的行数
                 *  @param format      需要打印的日志格式内容
                 *  @param ...         可变参数
                 *  @dicuss 本库不需要直接调用，可以用简易函数宏 @see UMSocialLogError,UMSocialLogWarn,UMSocialLogInfo,UMSocialLogDebug
                 */
               // UMSocialLog()
            
               print(String.init(format: "%@", error! as CVarArg))
            }else{
               
                if data is UMSocialShareResponse
                {
                    let resp:UMSocialShareResponse=data as! UMSocialShareResponse
                    print(resp.message)
                }else{
                    print(String.init(format: "%@", data! as! CVarArg))
                }
                
            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

