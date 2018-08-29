# matchmaster
It's a teamwork project that hasn't finished yet. ALl transactions/queries in database level have been finished. Some front end and JSP work still need to be done

****Project Specification****\
The basic idea behind your on-line dating system is that it will allow customers to use the web to browse/search the contents of your database (at least
that part you want the customer to see) and to meet people they would be interested in dating. In particular, your web site should allow users to
browse other user profiles and to contact those users they are interested in dating to see if the interest is mutual. It should also allow a user to
broadcast his/her current geo-location to see if there is another user in the area interested in meeting for e.g. a cup of coffee.
Additionally, your system should allow a user to "like" (as in facebook) another user's profile, and to alert two users if they like each other's profiles.
If you have downloaded the tinder app, you will see that it provides a similar feature. Moreover, your system should support a Rate a Date feature that
allows a user to rate a date he/she had with another user, and to make date ratings available for other users to see. Finally, your system should support
Referrals, where one user (User A) refers another user (User B) to a third user (User C), so that User C can go on a "blind date" with User B.
Your database system must be based on the specifications and requirements that follow.

***1 System Users***\
The users of your system will be the customers (AKA users) that use your system for online dating, customer representatives who provide customer-
related services, and the site's manager. You should assume that the computer knowledge of the users is limited (say, that of a typical AOL subscriber),
and thus your system must be easy to access and operate.


***2 Required Data***\
The data items required for the online dating database can be classified into six categories: profiles, likes, dates, reservations, customers and
employees.
The above classification does not imply any particular table arrangement. You are responsible for arranging the data items into tables, determining the
relationships among tables and identifying the key attributes. In addition, you should include indices in your tables to speed up query processing. You
should base your choice of indices on the type and expected frequency of the queries outlined in Section 3. Finally, you should specify and enforce
integrity constraints on the data, including referential integrity constraints.
You will first create an E-R diagram of your online dating system before developing your relational model. Details of this assignment will be
forthcoming.

**2.1 Profile Data**\
Each user may post one or more user profiles on the web site. This category of data should include the following items:

1. Profile ID
2. Profile Name (optional)
3. Age
4. Address (city, state)
5. M/F
6. Physical Characteristics
7. Hobbies and other Interests
8. Photos (optional)
9. Dating Geo-Range (in miles)
10. Dating Age Range

Each user has an ID; see the User Data category below. A user can specify a dating range in miles. For example, a user with a dating range of 25 miles
means that this user is only interested in dating someone who lives within 25 miles of him/her. Physical characteristics include height, weight, and
hair color.

**2.1 Likes Data**\
This category of data should include the following items:

1. Liker ID
2. Likee ID
3. Date/Time

One user profile (the liker) can "like" (as in facebook) another user profile (the likee). You should also record the date/time the liker liked the likee.

**2.3 Date Data**\
This category of data should include the following items:

1. Date ID
2. User 1 ID
3. User 2 ID
4. Date/Time
5. Geo-Location
6. Booking Fee
7. Customer Representative
8. Comments
9. User 1's Rating of the date
10. User 2's Rating of the date

A date is between two users of the system (User 1 and User 2), which takes place on a particular date/time and at a particular geo-location, in the case
of a geo-date. A date has an associated booking fee, which is primarily how your company makes money, and an associated customer representative.
That is, your company charges its customers every time they go on a date that the company helped to facilitate. Moreover, the customer representative
associated with the date is on-call during the date to provide on-the-spot dating advice to either of the two users on the date. Either user can post
comments about the date (before, during, or after the date). They can also rate the date Excellent, Very Good, Good, Fair, or Poor.

**2.4 Referral Data**\
This category of data should include the following items:

1. User A
2. User B
3. User C
4. Date/Time

User A refers User B to User C so that User C can go on a "blind date" with User B. You should also record the date/time the referral was made.

**2.5 Customer Data**\
The items required for this category include:

1. User ID
2. Last Name
3. First Name
4. Address
5. City
6. State
7. Zip Code
8. Telephone
9. E-mail Address
10. Account Number
11. Account Creation Date
12. Credit Card Number
13. Profile Placement Priority
14. Rating
15. Date/Time last active

Each customer (AKA user) has an associated User ID, which can be an arbitrary character string up to 24 characters long. A customer may view any
number of profiles, go on any number of dates, and have one or more accounts from which to pay the booking fees associated with dates. A customer
may also pay for a Profile Placement Priority (PPP), which helps determine the order in which his/her profile will be shown to other users. There are

three PPPs: Super-User, which costs $100/yr and gives this user's profile highest priority/visibility; Good-User, which costs $50/yr and provides mid-
level priority; and User-User, which is free and the default. User-User profiles will be displayed after higher-PPP users, assuming these higher-PPP

users are active. Let John Smith be a customer. John Smith's rating is based on the ratings he received on the dates he went on.

**2.6 Employee Data**\
This category of data should include the following:

1. Social Security #
2. Last Name
3. First Name
4. Address
5. City
6. State
7. Zip Code
8. Telephone
9. Start Date
10. Hourly Rate

***3 User-Level Transactions***

A database transaction can be viewed as a small program (written in the DML) that either updates or queries the database. Transactions that change
the contents of the database must do so in a consistent manner. Moreover, transactions should not interfere with one another when running
concurrently.
What follows is a breakdown of the user-level transactions that your database system should support. To make sure transactions maintain the integrity
of the database, you must write them using the SQL transaction structuring capabilities (i.e., begin transaction, commit transaction, etc.).

**3.1 Manager-Level Transactions**\
The manager should be able to:
Add, Edit and Delete information for an employee
Obtain a sales report for a particular month
Produce a comprehensive listing of all users
Produce a list of dates by calendar date or by customer name
Produce a summary listing of revenue generated by dates on a particular calendar date or involving a particular customer
Determine which customer representative generated most total revenue
Determine which customer generated most total revenue
Produce a list of most active customers
Produce a list of all customers who have dated a particular customer
Produce a list of the highest-rated customers
Produce a list of the highest-rated calendar dates to have a date on

**3.2 Customer-Representative-Level Transactions**\
Customer Representatives should be thought of as date "reservation agents" and should be able to:
Record a date
Add, Edit and Delete information for a customer
Produce customer mailing lists
Produce a list of profiles as date suggestions for a given profile (based on that profile's past dates)

**3.3 Customer-Level Transactions**\
Customers with active profiles should be thought of as online daters and should be able to easily browse and search for profiles of interest and set up
dates. In particular, they should be able to:
Make a date with another customer profile
Make a geo-date with another customer profile
Cancel a date
Comment on a date he/she went on or is going on
Like another customer's profile
Refer a Profile B to Profile C so that Profile C can go on a "blind date" with Profile B.
While customers will not be permitted to access the database directly, they should be able to retrieve the following information for each of their
profiles:
A profile's pending dates
A profile's past dates
A profile's favorites list (based on "likes")
Search for profiles based on physical characteristics, location, etc.
Most active profiles
Most highly rated profiles
Popular geo-date locations
Personalized date suggestion list

***4 User Access Control***

Your database system should provide controlled access to the data by distinguishing between the different types of users: manager, customer
representatives, and customers.
Customer Representatives should not be able to perform manager-level transactions; however, they should be able to read employee
information, except for the hourly rate.
Customer Representatives should be able to record the receipt of an order from a customer.
A customer should not be allowed access to other customers' account information, or to any employee information.
5 Utilities

In addition to the transactions described above, the system should provide facilities for:
Allowing the manager to add and delete users
Backing up the database files
A comprehensive Help facility, including a topic-driven pull-down Help menu

***6 User Interface***

HTML and its successors provide facilities for creating pop-up and pull-down menus, value lists, input/output forms, labels and customized reports.
You should make use of all of these capabilities, and in the process come up with a system that caters to users with only limited computer knowledge.
The information you provide to customers should look professional and inviting.
