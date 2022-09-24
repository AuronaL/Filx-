# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:`
# User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/97556484/192073925-c8c6e1be-8e03-4725-8306-f64bb345377d.gif)


### Notes
1. type match: in the detail screen we should change it to [String: Any]! not [[String: Any]]!
2. layout: the image view choose "Aspect Fill" then it will fill the cell other wise it will fit with other cell and cutoff automatically.
---
'@codepathreview'

## Flix Part 1

### User Stories
`TODO://` In the **User Stories section below**, add an `x` in the `-[ ]` like this `- [x]` for any user story you complete. (🚫 Remove this paragraph after checking off completed user stories)

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF
![ezgif com-gif-maker (4)](https://user-images.githubusercontent.com/97556484/190870000-75498e0e-62bd-49ba-950d-e41f9b18c07b.gif)


### Notes
Describe any challenges encountered while building the app.
1. Assitant missing -> reopened the XCode
2. Pictures can not find -> App Transport Security -> adding some key in info.plist.
(https://stackoverflow.com/questions/32427300/app-transport-security-xcode-7-beta-6/32609970#32609970)
