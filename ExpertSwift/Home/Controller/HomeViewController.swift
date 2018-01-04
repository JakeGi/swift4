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
    
    var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

    self.creatUI()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.requestData()
    }
    
    fileprivate func creatUI(){
        tableView = UITableView.init(frame: CGRect(x: 0, y: 164, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64-24), style: UITableViewStyle.plain)
        tableView?.delegate = self;
        tableView?.dataSource = self;
        view.addSubview(tableView!)
       
        let frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 100)
        let serverImages = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007587372591.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007388249407.png",
                            "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages)
        view.addSubview(cycleScrollView!)
        cycleScrollView?.delegate = self
    }
    
    fileprivate func requestData(){
        

        
        let user = SaveTools.mg_UnArchiver(path: "userInfo") as! NSDictionary
        print(user["token"]!)
        print(user["name"]!)
        print(user["birth"]!)
        print(user["police_code"]!)

        let token = user["token"]!
        
        let param = ["token":token,"page":"1","rows":"10"]
        NetWorkTools.requestData(type: .post, urlString:getHealthHomeListUrl, parameters: param, succeed: { (result, error) in
            print(result!)
        }, failure: { (error) in
            print(error!)

        })
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

