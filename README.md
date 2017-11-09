# Know Charge

- [user stories](https://docs.google.com/document/d/1rtCCKcx00lcgIlIgHCkc6H7B5vCKAMMOnrXf777cclE/edit?usp=sharing)
- [Wire frames](app/assets/images/figma.png "wire frames")
- [ERD](http://dbdesigner.net/designer/schema/121971)
- [Trello](https://trello.com/b/cuTwpHkR/know-charge)
- [Presentation](https://docs.google.com/presentation/d/1jIBjPDw2IsO7WM2G4OEattNptIKgz8E6DkoJz0-x18w/edit?usp=sharing)

## Development Path

### Step 1
The first step was to start with user stories. This gave me an idea of what I would need to build

### Step 2
From the user stories I constructed black and white wire frames in low detail. Things always seem to change during 
the development process, so investing a large amount of time for detailed wire frames (given the limmeted time for 
the project) seemed a dab idea.

### Step 3
With the user stories and wire frames information I constructed the database design in dbdesigner. This is a crucial 
step in getting things correct as changes here have a large impact on the project.

### Step 4
Trello was used to plan out the project, break it down into tasks and set a time line.
It is also a great place to log bugs as you go, so you can finish what you are working on and come back to them 
latter.

#### Step 5
Create the rails project and install all the gems in one go. Set up a .env file and load it with all the keys need. 
Research ideas and add any new keys as needed as I developed the project (google maps javascript key was the only one
 added latter).
  

## Installing
- Fork the repo and push to heroku
- You need to set up environment variables for: 
  - Google maps Javascript API
  - AWS S3 storage
  - Mail Gun (email)
  - Stripe (credit card payments)
  
- All the above require you to create keys on their web sites
- heroku run rails db:migrate
- heroku run rails db:seed

- app should now run and let you sign up/log in and set it up from menu item.
