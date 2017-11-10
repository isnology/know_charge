# Know Charge

#### The following are links to original web documents as well as exports/screen shots files in the project root 
path
- [user stories](https://docs.google.com/document/d/1rtCCKcx00lcgIlIgHCkc6H7B5vCKAMMOnrXf777cclE/edit?usp=sharing)
 'User Stories for KNOW CHARGE.docx'
- [Wire frames](app/assets/images/figma.png)
  'Know Charge.fig' 
- [ERD](http://dbdesigner.net/designer/schema/121971)
  'ERD Diagram.png' 
- [Trello](https://trello.com/b/cuTwpHkR/know-charge)
   'Trello 1.png', 'Trello 2.png' 
- [Presentation](https://docs.google.com/presentation/d/1jIBjPDw2IsO7WM2G4OEattNptIKgz8E6DkoJz0-x18w/edit?usp=sharing)
   'Know Charge.pptx'
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

### implemented
- Devise for user authentication, login/signup 
- Google maps javascript API in order to place pins for each charge station in system on the map
- Geocoder for lastitude and longitute and map positioning/searching
- Money-rails to show cents as dollars
- Action cable for chat
- full functioning immediate chat (can use 'send' button or enter/shift to send message)
- Kramdown for mark down capability in chat
- AWS S3 for image storage
- Shrine for image upload 
- fastimage, image_processing, mini-magic for image processing (used by Shrine)
- Stripe for credit card payments
- Simple calendar for visual on charge station bookings
- A combination of Bootstrap and flex box for style
- There is a "favourites" and "10 most recent bookings" page that you can also book from
- Full CRUD on each feature where applicable
- All tables in ERD implemented and used (except for extracting addresses into there own table, duplicated in Profile
 and Charge_station at the moment)
- Responsive for mobile (booking table not responsive for tablet size but ok for mobile)
- Most documentation

### not implemented yet
- Authorisation (with pundit)
- Email (in progress - for support and invoice receipt)
- RSpec (plan was to use rspec to add simple validation)
- Validation, on input data (some exists due to relationships and functionality)   
- Admin profile and console
- Indicator for unread chats
- media query for booking table (not responsive for tablet size)
- Styling tweeks

## Installing
- Fork the repo and push to heroku
- You need to set up environment variables for: 
  - Google maps Javascript API
  - AWS S3 storage
  - Mail Gun (email - can use heroku's addon )
  - Stripe (credit card payments)
  
- All the above require you to create keys on their web sites i.e. AWS, Google Maps etc, google it for instructions

- heroku run rails db:migrate
- heroku run rails db:seed

- App should now run and let you sign up/log in and you can set up charge stations and vehicles
- Once you have a vehicle and another user has a charge station then bookings and charging can be done
- Its possible to book your own charge station (reserve it for your own use)

