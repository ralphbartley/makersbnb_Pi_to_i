# Pi.to_i

## Day 1

### Morning

* Following chat from Eoin, jumped on zoom call and determined the goals for the day using a Trello board.

* Day 1 goals are:
- To go through the specification and determine user stories
- Determine the MVP
- Create domain models

### Afternoon

- Zoom call to discuss the user stories:
  * Didn't assign roles at this point
  * Spoke through the specifications as a group
  * Discussion over whether to distinguish between renters/rentees
  * Ralph and David made point that for MVP at this point it didn't make sense to distinguish


### Links to resources

https://docs.google.com/spreadsheets/d/1_totBZIJv9eqz6Xj9LUDiBgg2ke4HlIHrAair2whiFg/edit#gid=617897069

https://docs.google.com/document/d/15h02l-jIDOuAopcSUjPKOgRbQLpWYaYNMzbYvOPaOIo/edit

https://miro.com/app/board/o9J_lOB0CxE=/

## Day 2 Plan

- 10am
- One pair setup up Postgres and copy into SQL doc
- The other pair setting gem files and rspec etc.
- Aim to have done this by lunch-time and set up for the afternoon.
- Get together after that
- Assign roles. Break up into pairs
- Domain models done, flow charts completed
- Ready to start on user stories tomorrow

- Ensure two teams aren't overlapping with coding. i.e. Gemfiles etc

## Roles

- leader - David
- notetaker & readme - Ralph
- researcher - Will
- Trello - Max

### Morning

* 10 AM standup: discussed where we left off yesterday and decided we agreed enough on the domain modelling that we should move on to setting up the project files and getting to grips with using Git for the project.
* David and Ralph to create the database migrations setup and add it to the repo setup that Will and Max create, meet back up at 11am.
* Discussion at 11 focused on how we are to practically use Git for branches, how merging works, and set expectations for interactions with the repo.  We also finalized our understanding of what the MVP is looking to do.  Eóin popped in at 11.40 and helped with our understanding of Git, which is distilled below.
  1. The user stories in README.md will be executed in the simplest way possible while still adhering to a MVC concept using Ruby, Sinatra, and PostgreSQL.  Ruby models of Users, Spaces, and Bookings, SQL tables of users, spaces, bookings, dates_available, and Sinatra views/routes to be elicited as user stories are implemented.
  2. Git concepts we are going to use are branch, checkout and merge.  Possible look at using rebase.
    - The notetaker can push edits to README and notes without creating a new branch.  
    - A branch should be created for the feature being worked on.
    - The following pattern is roughly established
    ```
    $ git branch feature_name
    $ git checkout feature_name
    $ git add .
    $ git commit -m ""
    ```
 * Decided to split Front-end (Sinatra views and controller) and Back-end (Ruby model + database) to provide clear split in responsibilities and not editing shared files.
### Afternoon

* Front end/Back end split worked out really well, resulted in a clean merge (except for forgetting to add coverage logs to .gitignore)
* Caught up some but decided to leave further conversation to next morning's standup

## Day 2 Plan

- 10am
- Continue to work split front end and back end but changing pairings.
- Discussed how we want to go about binding front end and backend.
- Spoke about our MVP and if we felt it was still accurate.

## Roles

- leader - Ralph
- notetaker & readme - Will
- researcher - David
- Trello - Max

### Morning

* Backend created spaces class data base and worked on object wrapping
* Frontend work on navigation buttons and listing space view file.


### Afternoon

* Come back together as a 4 and worked through bugs to ensure frontend and backend work together.























