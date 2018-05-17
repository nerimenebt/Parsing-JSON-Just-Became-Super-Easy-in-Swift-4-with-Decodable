//
//  ViewController.swift
//  Json Parsing swift 4
//
//  Created by Nerimene  on 16/05/2018.
//  Copyright © 2018 Nerimene . All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable
{
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable
{
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var courses = [Course]()
    var names = [String]()
    var imgsLinks = [String]()
    var links = [String]()
    var numberLessons = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CourseCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CourseCell.reuseId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getCoursesData()
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
//        guard let url = URL(string: jsonUrlString) else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            //perhaps check err
//            //also perhaps check response status 200 OK
//            guard let data = data else { return }
//            do
//            {
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)
//
//            } catch let jsonErr
//            {
//                print("Error serializing json:", jsonErr)
//            }
//        }.resume()
    }
    
    func getCoursesData() {
        let jsonURL = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check err
            //also perhaps check response status 200 OK
            guard let data = data else { return }
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
                for index in self.courses
                {
                    self.names.append(index.name!)
                    self.links.append(index.link!)
                    self.imgsLinks.append(index.imageUrl!)
                    self.numberLessons.append(index.number_of_lessons!)
//                    print("\(self.sympolsCoin) : \(self.priceUSDcoin)")
                    self.tableView.reloadData()
                }
            }
            catch let jsonErr
            {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.courses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return CGFloat(CourseCell.cellHeight)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.reuseId) as! CourseCell
        cell.lblTitle.text = self.names[indexPath.row]
        cell.lblLink.text = self.links[indexPath.row]
        cell.lblNbre.text = String(self.numberLessons[indexPath.row]) + " Courses"
        
        let imageUrlString = self.imgsLinks[indexPath.row]
        let imageUrl:URL = URL(string: imageUrlString)!
        ImageService.getImage(withURL: imageUrl)
        { image in
            cell.img.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        UIApplication.shared.openURL(URL(string: self.links[indexPath.row])!)
    }
}
