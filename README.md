# JeweleryManagement
Jewelry Management is a web application developed using spring, hibernate, jsp, jdbc, html, css and bootstrap. It allows user to manage jewelry stocks and various jewelry types with great ease.

The application helps to maintain proper records of all the items in the jewelry store. Three item categories are provided: Gold, Silver, Artificial. Each item category has various items and further stocks are added for each item. Addition of item, stock is made easy and simpler. Stock of each item is maintained, automated updation of stocks on selling of a product is achieved. A better and easy approach for accessing, viewing and editing stocks for each item category is provided with the help of dashboard showing the total of each stock.

Working: 
1. Module user :  With validated username and password only one can login into the application. Features like viewing user profile as well as changing password is also provided.
2. Module item : a track of the identification number, item name, item code and item type had been kept. 3 Item categories have been chosen: Gold, Silver, artificial for which different items are added. Administrator can view or update or insert these details in the database.
3. Module stock : stores identification number, item type, item id for a particular item, date of purchase, bill no, vendor name, vendor address, quantity, weight, rate per gram, amount, any other amount, service tax, vat, paid amount, remaining amount and total amount. Administrator can view or update or insert these details in the database. 
4. Module customer transaction : All the items customer wish to purchase is shown in the table which is a temporary one and thus items purchased can be deleted here. On final save, stock is updated and customer transaction occurs.


Features: 
1. A user must have internet connection for accessing the web application.
2. New user has to register to the application. The user must provide user-name, password and other details.
3. User can log in to the application after proper username password authentication.
4. Other validations like no null, numeric and max length validations are also applied.
4. Features like viewing user profile as well as changing password is also provided.
5. Given that a user is logged in to the application, then the first page that is shown should be the dashboard page. The user is able to see all the stock details of each item category.
6. On selecting a category from dashboard, complete detail of the stock can be seen in table format. Updation and deletion page for stock is accessible from this table.
7. Add/view/update/delete item category page is also designed.
8. Add item in stock. View/update/delete stock details.
9. Customer selling page: Enter customer info, then item info the customer want to purchase. Item added for purchase is shown in a table format which is a temporary one and thus items to be purchased can be deleted from this list. It is like a cart to the customers. On final save, customer transaction occurs and stock is updated.
10. Automated scripts for calculating amount, total amount, remanining amount etc.

