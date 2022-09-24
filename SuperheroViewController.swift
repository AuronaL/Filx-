//
//  SuperheroViewController.swift
//  Flix-Movies
//
//  Created by Aurona Liu on 9/23/22.
//

import UIKit
import Alamofire

class SuperheroViewController: UIViewController {
    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleS: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleS.text = movie["title"] as? String
        synopsis.text = movie["overview"] as? String
        
        let baseUrl = "http://image.tmdb.org/t/p/w185"
              let posterPath = movie["poster_path"] as! String
              let posterUrl = URL(string: baseUrl + posterPath)
              
            poster.af.setImage(withURL: posterUrl!)
        
      
              let backdropPath = movie["backdrop_path"] as! String
              let backdropUrl = URL(string: "http://image.tmdb.org/t/p/w780" + backdropPath)
              
            backdrop.af.setImage(withURL: backdropUrl!)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
