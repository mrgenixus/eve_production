# Material Value*
* the market price of a material can be set
* the cost of a material is either
  * the cost of the material's blueprint build_cost
  * the market price of the material, if the price is lower
  * the unit_value of the material on_hand
  * the qty of the material
      * (minus material on_hand) times one of the above plus
      * unit_value of material on_hand

## Dev Notes
### Backend
- using UUID PK's http://labria.github.io/2013/04/28/rails-4-postgres-uuid-pk-guide/
