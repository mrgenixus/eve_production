Principal Design Considerations
===============================
A User should be able to use this tool to:
- create Build Orders and Work through them from creation to completion.
- manage inventory levels and values
- manage item composition and choose to work with any combination of levels for material source to build products
- should be able to manage sales of items and track the profit of those sales from job to job.

Usage Modes
===============================
- A User should be able to update the estimated cost of materials at any time, collectively updating the estimates for any unpurchased inventory
- A User should be able to add items to inventory at any time by specifying a quantity and purchase price
- A Build Order should be able to manage its own inventory as a seperate inventory from the global inventory, and the value should be based on the unit value at the time the inventory is allotted
- A Build Order should have a number of required items, and required items should be used to account for supply if the items are components in a different item
- A Build Order should understand and organize interdependent items so that the order can be built in dependency order.
- A User should be able to remove a number of items from inventory for sale, and pending sales should be tracked within the system
