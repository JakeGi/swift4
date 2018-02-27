//
//  HomeViewController.swift
//  ExpertSwift
//
//  Created by jyyl on 2017/11/8.
//  Copyright © 2017年 jyyl. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    var cycleScrollView:WRCycleScrollView?
    var titleArray : [String] = [String]()
    var exmapleIndex = 0
    var slideMenu:CKSlideMenu?
    
    var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(LoginBtn))
        self.navigationItem.rightBarButtonItem=item1
        example4()
        self.creatUI()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.requestData()
    }
    
    fileprivate func creatUI(){
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-100-NAV_HEIGHT), style: UITableViewStyle.plain)
        tableView?.delegate = self;
        tableView?.dataSource = self;
        view.addSubview(tableView!)
       
//        let frame = CGRect(x: 0, y: NAV_HEIGHT, width: SCREEN_WIDTH, height: 100)
//        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
//                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
//        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages)
//        view.addSubview(cycleScrollView!)
//        cycleScrollView?.delegate = self
    }
    
    fileprivate func requestData(){
        
        let user = SaveTools.mg_UnArchiver(path: "userInfo") as! NSDictionary
        print(user["token"]!)
//        print(user["name"]!)
//        print(user["birth"]!)
//        print(user["police_code"]!)

        let token = "12121121212"
        let param = ["phone":"15800000000","password":"123456","login_type":"phone","platform":"0","alias":"31323121231"]

        JHNetManagerAPI.shareManager.JHRequestData(.post, URLString: getNewsListByTypeUrl, para: param , ShowHUD: true) { (result) in
            print(result!);
        }
//        NetWorkTools.requestData(type: .post, urlString:getHealthHomeListUrl, parameters: param, succeed: { (result, error) in
//            print(result!)
//        }, failure: { (error) in
//            print(error!)
//
//        })
    }
    func example4()  {
        let titles = ["今天","速度100","是啊","测试机","水电","今天","速度","是啊","今天","速度","是啊"]
        var arr:Array<UIViewController> = []
        for _ in 0 ..< titles.count {
            let vc = UIViewController()
            self.addChildViewController(vc)
            arr.append(vc)
        }
        slideMenu = CKSlideMenu(frame: CGRect(x:0,y:64,width:view.frame.width,height:40), titles:titles, childControllers:arr)
        
        slideMenu?.titleStyle = .gradient
        slideMenu?.indicatorStyle = .followText
        slideMenu?.unSelectedColor = UIColor.gray
        slideMenu?.bottomPadding = 4
        slideMenu?.indicatorHeight = 2
        slideMenu?.bodySuperView = view
        slideMenu?.bodyFrame = CGRect.init(x: 0, y: 104, width: view.frame.width, height: view.frame.height - 104)
        view.addSubview(slideMenu!)
    }
    
    @objc func LoginBtn(){
        
    }


}
extension HomeViewController: WRCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource
{

    
    /// 点击图片事件
    func cycleScrollViewDidSelect(at index:Int, cycleScrollView:WRCycleScrollView)
    {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动事件
    func cycleScrollViewDidScroll(to index:Int, cycleScrollView:WRCycleScrollView)
    {
        print("滚动到了第\(index+1)个图片")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return nil
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
//    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:CustomCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        if cell == nil {
            cell = CustomCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        cell!.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//        let model:BasicTypes = (self.dataArr[indexPath.row] as! BasicTypes)
        cell?.titleLab.text = String(indexPath.row)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = homeDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

