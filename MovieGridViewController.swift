//
//  MovieGridViewController.swift
//  Flix-Movies
//
//  Created by Aurona Liu on 9/23/22.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    

    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        // TODO: Store the movies in a property to use elsewhere
        // TODO: Reload your table view data
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumLineSpacing * 2 ) / 2
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        let url = URL(string: "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
            // TODO: Get the array of movies from the internet
                self.movies = dataDictionary["results"] as! [[String:Any]]
                //tell the program reload the data -> call the method again
                self.collectionView.reloadData()
               
                print(self.movies)
             }
        }
            task.resume()
        }
                   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        let movie = movies[indexPath.item]
        let baseUrl = "http://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
       }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
    
        //find the selected movie
        let cell = sender as! MovieCollectionViewCell
        let indexpath = collectionView.indexPath(for: cell)!
        let movie = movies[indexpath.row]
        
        // Pass the selected object to the new view controller.
        let details = segue.destination as! SuperheroViewController
        details.movie = movie
        
        collectionView.deselectItem(at: indexpath, animated: true)
    }
    
}
